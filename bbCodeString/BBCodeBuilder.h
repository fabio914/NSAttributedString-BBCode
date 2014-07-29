//
//  BBCodeBuilder.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSAttributedStringBBCodeDelegate.h"

@interface BBCodeBuilder : NSObject

@property (nonatomic, assign) id<NSAttributedStringBBCodeDelegate> delegate;

+ (NSAttributedString *)buildAttributedStringFromString:(NSString *)string;
+ (NSAttributedString *)buildAttributedStringFromString:(NSString *)string delegate:(id<NSAttributedStringBBCodeDelegate>)delegate;
- (id)initWithString:(NSString *)string;
- (NSAttributedString *)attributedString;

@end
