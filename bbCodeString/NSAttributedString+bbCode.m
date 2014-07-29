//
//  NSAttributedString+bbCode.m
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import "NSAttributedString+bbCode.h"
#import "BBCodeBuilder.h"

/*
 * Supported tags:
 *
 * [u][/u] for Underline.
 * [font name="..." size="..."][/font] for a custom Font.
 * [color hex="..."][/color] for a custom text color.
 *
 */

@implementation NSAttributedString (bbCode)

+ (NSAttributedString *)attributedStringWithBBCode:(NSString *)bbCodeString {
    
    return [BBCodeBuilder buildAttributedStringFromString:bbCodeString];
}

@end
