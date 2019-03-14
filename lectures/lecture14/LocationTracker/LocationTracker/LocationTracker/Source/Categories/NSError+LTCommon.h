//
//  NSError+LTCommon.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (LTCommon)

+ (NSError *)lt_errorWithCode:(NSUInteger)code;
+ (NSError *)lt_errorWithCode:(NSUInteger)code reason:(nullable NSString *)reason description:(nullable NSString *)description;
+ (NSError *)lt_errorWithCode:(NSUInteger)code userInfo:(nullable NSDictionary *)userInfo;
+ (NSError *)lt_errorWithDomain:(nullable NSString *)domain code:(NSUInteger)code userInfo:(nullable NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
