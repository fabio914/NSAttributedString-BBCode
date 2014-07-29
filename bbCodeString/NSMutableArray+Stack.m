//
//  NSMutableArray+Stack.m
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object {
    
    [self addObject:object];
}

- (id)pop {
    
    id object = [[self lastObject] retain];
    [self removeObjectAtIndex:[self count] - 1];
    return [object autorelease];
}

- (id)top {
    
    return [self lastObject];
}

@end
