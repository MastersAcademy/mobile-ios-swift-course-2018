//
//  LocationManagedModel.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LocationManagedModel.h"
#import "LocationManagedModelKeys.h"
#import "UserManagedModel.h"

#import <CoreLocation/CLLocation.h>
#import "NSManagedObject+LTCommon.h"

@implementation LocationManagedModel

#pragma mark - Public Methods

- (void)createWithCoreLocation:(CLLocation *)coreLocation inContext:(NSManagedObjectContext *)context
{
    self.dataId = [NSString lt_uuidString];
    self.createDate = [NSDate date];
    self.locationDate = coreLocation.timestamp;
    self.latitude = coreLocation.coordinate.latitude;
    self.longitude = coreLocation.coordinate.longitude;
}

#pragma mark - LTCommonManagedModelProtocol Methods

- (void)createWithInfo:(NSDictionary *)info inContext:(NSManagedObjectContext *)context
{
    self.dataId = [info lt_getSecureStringForKey:LocationDataIdKey defaultString:[NSString lt_uuidString]];
    self.createDate = [info lt_getSecureDateForKey:LocationCreateDateKey defaultDate:[NSDate date]];
    self.locationDate = [info lt_getSecureDateForKey:LocationLocationDateKey defaultDate:[NSDate date]];
    self.latitude = [info lt_getSecureNumberForKey:LocationLatitudeKey defaultNumber:[NSNumber numberWithDouble:kCLLocationCoordinate2DInvalid.latitude]].doubleValue;
    self.longitude = [info lt_getSecureNumberForKey:LocationLongitudeKey defaultNumber:[NSNumber numberWithDouble:kCLLocationCoordinate2DInvalid.longitude]].doubleValue;
}

@end
