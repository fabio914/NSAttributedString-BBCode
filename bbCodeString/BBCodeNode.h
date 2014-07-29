//
//  BBCodeNode.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBCodeNode : NSObject

@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) NSDictionary * params;
@property (nonatomic, retain) NSArray * nodes;

@end
