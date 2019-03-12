//
//  LTDataHelper+Location.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper.h"
#import "LTDataHelperConstants.h"

@class LocationManagedModel, CLLocation;

NS_ASSUME_NONNULL_BEGIN

@interface LTDataHelper (Location)

+ (void)saveLocations:(NSArray<CLLocation *> *)locations withCompletion:(nullable LTDataHelperVoidCompletionBlock)completion;

+ (void)deleteLocationsByIds:(NSArray<NSString *> *)locationIds withCompletion:(nullable LTDataHelperVoidCompletionBlock)completion;

+ (void)deleteAllLocationsWithCompletion:(nullable LTDataHelperVoidCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
