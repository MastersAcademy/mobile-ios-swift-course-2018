//
//  UIFont+LTTheme.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIFont+LTTheme.h"

@implementation UIFont (LTTheme)

+ (UIFont *)lt_fontWithSize:(CGFloat)pointSize weight:(CGFloat)weight
{
    return [UIFont systemFontOfSize:pointSize weight:weight];
}

+ (UIFont *)lt_regularFontWithWeight:(CGFloat)weight
{
    return [self lt_fontWithSize:14 weight:weight];
}


+ (UIFont *)lt_tabBarFontWithWeight:(CGFloat)weight
{
    return [self lt_fontWithSize:10 weight:weight];
}

+ (UIFont *)lt_navigationBartTitleFontWithWeight:(CGFloat)weight
{
    return [self lt_fontWithSize:17 weight:weight];
}

+ (UIFont *)lt_actionButtonFontWithWeight:(CGFloat)weight
{
    return [self lt_fontWithSize:17 weight:weight];
}

@end
