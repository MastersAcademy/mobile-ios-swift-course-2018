//
//  NSError+LTCommon.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSError+LTCommon.h"

@implementation NSError (LTCommon)

+ (NSString *)lt_domain
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSError *)lt_errorWithCode:(NSUInteger)code
{
    return [self lt_errorWithCode:code userInfo:nil];
}

+ (NSError *)lt_errorWithCode:(NSUInteger)code reason:(nullable NSString *)reason description:(nullable NSString *)description
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];

    [userInfo setValue:reason forKey:NSLocalizedFailureReasonErrorKey];
    [userInfo setValue:description forKey:NSLocalizedDescriptionKey];

    return [self lt_errorWithCode:code userInfo:[userInfo copy]];
}

+ (NSError *)lt_errorWithCode:(NSUInteger)code userInfo:(nullable NSDictionary *)userInfo
{
    return [self lt_errorWithDomain:nil code:code userInfo:userInfo];
}

+ (NSError *)lt_errorWithDomain:(nullable NSString *)domain code:(NSUInteger)code userInfo:(nullable NSDictionary *)userInfo
{
    NSError *error = [NSError errorWithDomain:domain ?: [self lt_domain] code:code userInfo:userInfo];

    return error;
}

@end
