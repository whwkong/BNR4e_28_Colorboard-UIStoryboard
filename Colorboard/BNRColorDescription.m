//
//  BNRColorDescription.m
//  Colorboard
//
//  Created by William Kong on 2014-07-08.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

- (instancetype)init
{
    self = [super init];
    // default color is Blue
    if (self) {
        _color = [UIColor colorWithRed:0
                                 green:0
                                  blue:1
                                 alpha:1];
        _name = @"Blue";
    }
    return self; 
}

@end
