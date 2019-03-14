//
//  UIColor+LTTheme.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LTTheme)

+ (UIColor *)lt_tabBarItemColor;
+ (UIColor *)lt_tabBarItemColorSelected;

+ (UIColor *)lt_navigationTitleColor;
+ (UIColor *)lt_navigationTintColor;

+ (UIColor *)lt_buttonTitleColor;
+ (UIColor *)lt_buttonBorderColor;

+ (UIColor *)lt_historyCellTitleColor;
+ (UIColor *)lt_historyCellDateColor;

+ (UIColor *)lt_placeholderTextColor;

@end
