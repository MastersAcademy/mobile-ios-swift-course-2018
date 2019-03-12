//
//  LocationConfigurationTests.m
//  LocationConfigurationTests
//
//  Created by Maksym Savisko on 3/10/19.
//  Copyright © 2019 Maksym Savisko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LocationConfiguration.h"
#import <CoreLocation/CLLocation.h>

@interface LocationConfigurationTests : XCTestCase

@end

@implementation LocationConfigurationTests

- (void)testDefaultConfiguration {
    //
    LocationConfiguration *configuration = [LocationConfiguration defaultConfiguration];
    
    //
    XCTAssertEqual(configuration.timeFilter, 300.0);
    XCTAssertEqual(configuration.distanceFilter, 200.0);
    XCTAssertEqual(configuration.allowBackgroundUpdates, YES);
    XCTAssertEqual(configuration.allowTimeFilter, YES);
    XCTAssertEqual(configuration.desiredAccuracy, kCLLocationAccuracyBestForNavigation);
}

@end
