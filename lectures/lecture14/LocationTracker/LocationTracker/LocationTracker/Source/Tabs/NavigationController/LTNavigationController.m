//
//  LTNavigationController.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTNavigationController.h"
#import "LTThemeHelper.h"

@interface LTNavigationController ()

@end

@implementation LTNavigationController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [LTThemeHelper customizeNavigationBar:self.navigationBar];
}


@end
