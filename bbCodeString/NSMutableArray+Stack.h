//
//  NSMutableArray+Stack.h
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (void)push:(id)object;
- (id)pop;
- (id)top;

@end
