//
//  LTTabBarController.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTTabBarController.h"
#import "LTThemeHelper.h"

static NSInteger const kInitialViewControllerIndex = 0;

@interface LTTabBarController ()

@end

@implementation LTTabBarController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setInitalViewControllerIndex:kInitialViewControllerIndex];
    [LTThemeHelper customizeTabBar:self.tabBar];
}

#pragma mark - Setup Methods

- (void)setInitalViewControllerIndex:(NSUInteger)index
{
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController *_Nonnull obj, NSUInteger controllerIdx, BOOL *_Nonnull stop) {

        if (controllerIdx == index) {
            self.selectedIndex = controllerIdx;
        }
    }];
}

@end
