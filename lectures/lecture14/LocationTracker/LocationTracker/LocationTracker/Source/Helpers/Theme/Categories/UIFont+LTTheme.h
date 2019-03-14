//
//  UIFont+LTTheme.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (LTTheme)

+ (UIFont *)lt_fontWithSize:(CGFloat)pointSize weight:(CGFloat)weight;
+ (UIFont *)lt_regularFontWithWeight:(CGFloat)weight;

+ (UIFont *)lt_tabBarFontWithWeight:(CGFloat)weight;
+ (UIFont *)lt_navigationBartTitleFontWithWeight:(CGFloat)weight;
+ (UIFont *)lt_actionButtonFontWithWeight:(CGFloat)weight;

@end
