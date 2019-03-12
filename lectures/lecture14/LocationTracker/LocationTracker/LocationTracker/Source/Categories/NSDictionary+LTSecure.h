//
//  NSDictionary+LTSecure.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (LTSecure)

- (nullable id)lt_getSecureValueForKey:(NSString *)key withClass:(Class)keyClass andDefaulValue:(nullable id)defaultValue;

- (nullable NSString *)lt_getSecureStringForKey:(NSString *)key defaultString:(nullable NSString *)defaultString;

- (nullable NSDate *)lt_getSecureDateForKey:(NSString *)key defaultDate:(nullable NSDate *)defaultDate;

- (nullable NSNumber *)lt_getSecureNumberForKey:(NSString *)key defaultNumber:(nullable NSNumber *)defaultNumber;

@end

NS_ASSUME_NONNULL_END
