//
//  BBCodeNode.m
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import "BBCodeNode.h"

@implementation BBCodeNode

- (void)dealloc {
    
    [_tag release];
    [_params release];
    [_nodes release];
    
    [super dealloc];
}

@end
