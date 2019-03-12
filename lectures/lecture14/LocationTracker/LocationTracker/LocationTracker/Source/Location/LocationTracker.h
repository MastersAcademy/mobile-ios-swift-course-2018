//
//  LocationTracker.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLError.h>

@class LocationConfiguration;

NS_ASSUME_NONNULL_BEGIN

@protocol LocationTrackerObserver

@optional
- (void)onLocationUpdate:(CLLocation *)location;
- (void)onLocationError:(NSError *)error;
@end

@interface LocationTracker : NSObject

// clue for improper use (produces compile time error)
- (nullable instancetype)init __attribute__((unavailable("init not available, call defaultTracker instead")));
+ (nullable instancetype) new __attribute__((unavailable("new not available, call defaultTracker instead")));

@property (nonatomic, strong, readonly) LocationConfiguration *configuration;
@property (nonatomic, readonly) BOOL isStarted;

+ (nullable instancetype)defaultTracker;
+ (nullable instancetype)trackerWithConfiguration:(LocationConfiguration *)configuration;

+ (BOOL)isLocationServiceRequested;
+ (BOOL)isServiceEnabled;

- (void)start;
- (void)stop;

- (nullable CLLocation *)lastLocation;

- (void)addObserver:(id<LocationTrackerObserver>)observer;
- (void)removeObserver:(id<LocationTrackerObserver>)observer;

@end

NS_ASSUME_NONNULL_END
