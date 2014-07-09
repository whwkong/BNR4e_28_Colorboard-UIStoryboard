//
//  BNRColorViewController.h
//  Colorboard
//
//  Created by William Kong on 2014-07-08.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRColorDescription.h"

@interface BNRColorViewController : UIViewController

@property (nonatomic) BOOL existingColor;
@property (nonatomic) BNRColorDescription *colorDescription;

@end
