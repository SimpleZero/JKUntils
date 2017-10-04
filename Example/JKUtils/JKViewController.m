//
//  JKViewController.m
//  JKUtils
//
//  Created by SimpleZero on 10/04/2017.
//  Copyright (c) 2017 SimpleZero. All rights reserved.
//

#import "JKViewController.h"
#import "JKUtilsExample.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JKUtilsExample *utilsExample = [[JKUtilsExample alloc] init];
    [self pushViewController:utilsExample animated:NO];
}

@end
