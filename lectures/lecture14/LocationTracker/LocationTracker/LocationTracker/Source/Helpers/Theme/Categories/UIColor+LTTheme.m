//
//  UIColor+LTTheme.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIColor+LTTheme.h"

@implementation UIColor (LTTheme)

#pragma mark - Primary colors

+ (UIColor *)lt_primaryColor
{
    return [UIColor colorWithRed:202.f / 255.f green:0.f / 255.f blue:255.f / 255.f alpha:1.0];
}

+ (UIColor *)lt_secondaryColor
{
    return [UIColor lt_blackColor];
}

+ (UIColor *)lt_blackColor
{
    return [UIColor blackColor];
}

+ (UIColor *)lt_grayColor
{
    return [UIColor colorWithRed:152.f / 255.f green:149.f / 255.f blue:143.f / 255.f alpha:1.0];
}

#pragma mark -

+ (UIColor *)lt_tabBarItemColor
{
    return [self lt_grayColor];
}

+ (UIColor *)lt_tabBarItemColorSelected
{
    return [self lt_primaryColor];
}

+ (UIColor *)lt_navigationTitleColor
{
    return [self lt_primaryColor];
}

+ (UIColor *)lt_navigationTintColor
{
    return [UIColor lt_primaryColor];
}

+ (UIColor *)lt_buttonTitleColor
{
    return [UIColor lt_primaryColor];
}

+ (UIColor *)lt_buttonBorderColor
{
    return [UIColor lt_primaryColor];
}

+ (UIColor *)lt_historyCellTitleColor
{
    return [self lt_secondaryColor];
}

+ (UIColor *)lt_historyCellDateColor
{
    return [self lt_primaryColor];
}

+ (UIColor *)lt_placeholderTextColor
{
    return [self lt_grayColor];
}

@end
