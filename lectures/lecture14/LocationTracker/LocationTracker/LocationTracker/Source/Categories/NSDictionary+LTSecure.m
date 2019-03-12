//
//  NSDictionary+LTSecure.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSDictionary+LTSecure.h"

@implementation NSDictionary (LTSecure)

- (id)lt_getSecureValueForKey:(NSString *)key withClass:(Class)keyClass andDefaulValue:(id)defaultValue
{
    id value = [self valueForKey:key];

    if (value && [value isKindOfClass:keyClass]) {
        return value;
    }

    return defaultValue;
}

- (nullable NSString *)lt_getSecureStringForKey:(NSString *)key defaultString:(nullable NSString *)defaultString
{
    return [self lt_getSecureValueForKey:key withClass:[NSString class] andDefaulValue:defaultString];
}

- (nullable NSDate *)lt_getSecureDateForKey:(NSString *)key defaultDate:(nullable NSDate *)defaultDate
{
    return [self lt_getSecureValueForKey:key withClass:[NSDate class] andDefaulValue:defaultDate];
}

- (nullable NSNumber *)lt_getSecureNumberForKey:(NSString *)key defaultNumber:(nullable NSNumber *)defaultNumber
{
    return [self lt_getSecureValueForKey:key withClass:[NSNumber class] andDefaulValue:defaultNumber];
}

@end
