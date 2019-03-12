//
//  LTThemeHelper.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTThemeHelper : NSObject

+ (void)customizeTabBar:(__kindof UITabBar *)tabBar;
+ (void)customizeNavigationBar:(__kindof UINavigationBar *)navigationBar;
+ (void)customizeButton:(__kindof UIButton *)button;
+ (void)customizeLayoutButton:(__kindof UIButton *)button;
+ (void)customizeCell:(__kindof UITableViewCell *)cell;
+ (void)customizeDestructiveBarItem:(__kindof UIBarItem *)item;
+ (void)customizeLabel:(__kindof UILabel *)label;

@end
