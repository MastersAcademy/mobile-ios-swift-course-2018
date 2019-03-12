//
//  NSDate+LTTimeAgo.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSDate+LTTimeAgo.h"

@implementation NSDate (LTTimeAgo)

+ (NSDateFormatter *)lt_dateFormatter
{
    static dispatch_once_t pred;
    static id _timeAgoDateFormatter = nil;
    dispatch_once(&pred, ^{

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [NSLocale currentLocale];
        [formatter setDateFormat:@"HH:mm dd.MM"];
        _timeAgoDateFormatter = formatter;
    });

    return _timeAgoDateFormatter;
}
@end
