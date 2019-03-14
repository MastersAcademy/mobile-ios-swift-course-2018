//
//  LocationManagedModel.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserManagedModel, CLLocation;

NS_ASSUME_NONNULL_BEGIN

@interface LocationManagedModel : NSManagedObject

- (void)createWithCoreLocation:(CLLocation *)coreLocation inContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "LocationManagedModel+CoreDataProperties.h"
#import "NSManagedObject+LTCommon.h"
