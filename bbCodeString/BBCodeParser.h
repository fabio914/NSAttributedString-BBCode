//
//  BBCodeParser.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBCodeNode.h"

@interface BBCodeParser : NSObject

@property (nonatomic, retain) BBCodeNode * root;

+ (BBCodeNode *)treeWithString:(NSString *)string;
- (id)initWithString:(NSString *)string;

@end
