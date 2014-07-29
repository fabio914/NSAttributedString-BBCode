//
//  BBCodeBuilder.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBCodeBuilder : NSObject

+ (NSAttributedString *)buildAttributedStringFromString:(NSString *)string;
- (id)initWithString:(NSString *)string;
- (NSAttributedString *)attributedString;

@end
