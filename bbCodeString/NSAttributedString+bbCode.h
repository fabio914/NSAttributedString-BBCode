//
//  NSAttributedString+bbCode.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSAttributedStringBBCodeDelegate.h"

@interface NSAttributedString (bbCode)

+ (NSAttributedString *)attributedStringWithBBCode:(NSString *)bbCodeString;
+ (NSAttributedString *)attributedStringWithBBCode:(NSString *)bbCodeString delegate:(id<NSAttributedStringBBCodeDelegate>)delegate;


@end
