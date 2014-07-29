//
//  NSAttributedStringBBCodeDelegate.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSAttributedStringBBCodeDelegate <NSObject>

@optional
- (NSDictionary *)attributesForTag:(NSString *)tag params:(NSDictionary *)params previous:(NSDictionary *)attributes;

@end
