//
//  BBCodeParser.m
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import "BBCodeParser.h"

@interface BBCodeParser()

@property (nonatomic, retain) NSString * origin;
@property (nonatomic) NSUInteger position;

@end

@implementation BBCodeParser

+ (BBCodeNode *)treeWithString:(NSString *)string {
    
    BBCodeParser * parser = [[[self alloc] initWithString:string] autorelease];
    
    return [parser root];
}

- (id)initWithString:(NSString *)string {
    
    if(self = [super init]) {
        
        _origin = [string retain];
        _position = 0;
    }
    
    return self;
}

- (BBCodeNode *)root {
    
    if(!_root) {
        
        _root = [[BBCodeNode alloc] init];
        _root.tag = @"root";
        _root.params = @{};
        _root.nodes = [self parseItems];
    }
    
    return _root;
}

- (unichar)lookupChar {
    
    if(_position < [_origin length]) {
        
        return [_origin characterAtIndex:_position];
    }
    
    return '\0';
}

- (unichar)nextChar {
    
    if(_position < [_origin length]) {
        
        unichar ch = [_origin characterAtIndex:_position];
        _position++;
        return ch;
    }
    
    return '\0';
}

- (BOOL)isWhite:(unichar)ch {
    return (ch == ' ' || ch == '\n' || ch == '\t' || ch == '\r');
}

- (void)skipWhite {
    
    while([self isWhite:[self lookupChar]]) [self nextChar];
}

- (BOOL)skipWhiteAndMatch:(unichar)ch {
    
    [self skipWhite];
    BOOL ret = [self match:ch];
    [self skipWhite];
    
    return ret;
}

- (BOOL)match:(unichar)ch {
    
    if(ch == [self lookupChar]) {
        
        [self nextChar];
        return YES;
    }
    
    @throw [NSException exceptionWithName:@"Mismatch" reason:[NSString stringWithFormat:@"Could not match character '%c', got '%c'!", ch, [self lookupChar]] userInfo:nil];
    
    return NO;
}

- (NSArray *)parseItems {
    
    NSMutableArray * array = [NSMutableArray array];
    NSMutableString * aux = [NSMutableString string];
    
    while([self lookupChar] != '\0') {
        
        if([self lookupChar] == '\\') {
            [self nextChar];
            
            if([self lookupChar] == '[') {
            
                [self nextChar];
                [aux appendString:@"["];
            }
            
            else if([self lookupChar] == '\\') {
                
                [self nextChar];
                [aux appendString:@"\\"];
            }
            
            else if([self lookupChar] == 'n') {
                
                [self nextChar];
                [aux appendString:@"\n"];
            }
            
            else {
                
#warning TODO Improve...
                [aux appendString:[NSString stringWithFormat:@"\\%c", [self nextChar]]];
            }
        }
        
        if([self lookupChar] == '[') {
            [self skipWhiteAndMatch:'['];
            
            if([self lookupChar] == '/') {
                
                break;
            }
            
            if(![aux isEqualToString:@""]) {
                
                [array addObject:aux];
                aux = [NSMutableString string];
            }
            
            [array addObject:[self parseNode]];
        }
        
        else {
            
            unichar ch = [self nextChar];
            [aux appendString:[NSString stringWithCharacters:&ch length:1]];
        }
    }
    
    if(![aux isEqualToString:@""]) {
        
        [array addObject:aux];
    }
    
    return array;
}

/* [tag ...]...[/tag] */
- (BBCodeNode *)parseNode {

    NSString * tag = @"", * key = @"", * value = @"";
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    tag = [self getToken];
    
    while([self lookupChar] != ']') {
        
        /* ...="..." */
        key = [self getToken];
        [self skipWhiteAndMatch:'='];
        value = [self getParam];
        [params setObject:value forKey:key];
    }
    [self match:']'];
    
    NSArray * nodeArray = [self parseItems];
    
    [self skipWhiteAndMatch:'/'];
    NSString * endTag = [self getToken];
    [self match:']'];
    
    if(![tag isEqualToString:endTag]) {
        
        @throw [NSException exceptionWithName:@"Tag mismatch" reason:[NSString stringWithFormat:@"Tag \'%@\' finishes with tag \'%@\'.", tag, endTag] userInfo:nil];
    }
    
    BBCodeNode * node = [[BBCodeNode alloc] init];
    node.params = params;
    node.tag = tag;
    node.nodes = nodeArray;
    
    return [node autorelease];
}

- (BOOL)validTokenChar:(unichar)ch {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
}

/* ... */
- (NSString *)getToken {
    
    NSMutableString * token = [NSMutableString string];
    
    while([self validTokenChar:[self lookupChar]]) {
        
        unichar ch = [self nextChar];
        
        [token appendString:[NSString stringWithCharacters:&ch length:1]];
    }
    
    [self skipWhite];
    
    return token;
}

/* "..." */
- (NSString *)getParam {
    
    NSMutableString * param = [NSMutableString string];
    
    [self skipWhiteAndMatch:'"'];
    while([self lookupChar] != '"') {
        
        if([self lookupChar] == '\\') {
            [self nextChar];
            
            if([self lookupChar] == '\\') {
                
                [self nextChar];
                [param appendString:@"\\"];
            }
            
            else if([self lookupChar] == 'n') {
                
                [self nextChar];
                [param appendString:@"\n"];
            }
            
            else {
            
#warning TODO Improve...
                [param appendString:[NSString stringWithFormat:@"\\%c", [self nextChar]]];
            }
        }
        
        else {
            
            unichar ch = [self nextChar];
            [param appendString:[NSString stringWithCharacters:&ch length:1]];
        }
    }
    [self match:'"'];
    [self skipWhite];
    
    return param;
}

- (void)dealloc {
    
    [_origin release];
    [_root release];
    [super dealloc];
}

@end
