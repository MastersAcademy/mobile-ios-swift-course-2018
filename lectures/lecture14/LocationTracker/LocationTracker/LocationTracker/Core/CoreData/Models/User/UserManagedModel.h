//
//  UserManagedModel.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LocationManagedModel;

NS_ASSUME_NONNULL_BEGIN

@interface UserManagedModel : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "UserManagedModel+CoreDataProperties.h"
#import "NSManagedObject+LTCommon.h"
