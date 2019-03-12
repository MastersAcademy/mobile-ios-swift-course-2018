//
//  LocationConfiguration.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LocationConfiguration.h"
#import <CoreLocation/CLLocation.h>

static NSTimeInterval const kDefaultConfigurationTimeFilter = 300.0;
static double const kDefaultConfigurationDistanceFilter = 200.0;
static BOOL const kDefaultConfigurationBackgroundUpdates = YES;
static BOOL const kDefaultConfigurationTimeFilterAllowances = YES;

@implementation LocationConfiguration

#pragma mark - Public

+ (instancetype)defaultConfiguration
{
    LocationConfiguration *configuration = [[LocationConfiguration alloc] init];
    configuration.timeFilter = kDefaultConfigurationTimeFilter;
    configuration.distanceFilter = kDefaultConfigurationDistanceFilter;
    configuration.allowBackgroundUpdates = kDefaultConfigurationBackgroundUpdates;
    configuration.allowTimeFilter = kDefaultConfigurationTimeFilterAllowances;
    configuration.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    return configuration;
}

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];

    if (self) {
        _timeFilter = 0;
        _distanceFilter = 0;
        _allowBackgroundUpdates = NO;
        _desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _allowTimeFilter = NO;
    }

    return self;
}

@end
