//
//  LocationConfiguration.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationConfiguration : NSObject

@property (nonatomic) double distanceFilter;
@property (nonatomic) NSTimeInterval timeFilter;
@property (nonatomic) BOOL allowBackgroundUpdates;
@property (nonatomic) BOOL allowTimeFilter;
@property (nonatomic) double desiredAccuracy;

+ (instancetype) defaultConfiguration;

@end
