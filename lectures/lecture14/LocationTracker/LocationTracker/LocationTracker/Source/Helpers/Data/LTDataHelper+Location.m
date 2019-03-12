//
//  LTDataHelper+Location.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper+Location.h"
#import "LTDataHelper+Private.h"
#import "LTDataHelper+User.h"
#import "LTDataHelper+Delete.h"
#import "LocationManagedModel.h"

@implementation LTDataHelper (Location)

+ (void)saveLocations:(NSArray<CLLocation *> *)locations withCompletion:(LTDataHelperVoidCompletionBlock)completion
{
    LTDataHelperExecuteOnContextBlock executionBlock = ^(NSManagedObjectContext *_Nonnull localContext) {
        UserManagedModel *user = [LTDataHelper currentUserModelInContext:localContext];

        [locations enumerateObjectsUsingBlock:^(CLLocation *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            LocationManagedModel *location = [LocationManagedModel MR_createEntityInContext:localContext];
            [location createWithCoreLocation:obj inContext:localContext];
            [user addLocationHistoryObject:location];
        }];
    };

    [self saveWithBlock:executionBlock backgroundQueue:YES completion:completion];
}

+ (void)deleteLocationsByIds:(NSArray<NSString *> *)locationIds withCompletion:(LTDataHelperVoidCompletionBlock)completion
{
    LTDataHelperExecuteOnContextBlock executionBlock = ^(NSManagedObjectContext *_Nonnull localContext) {
        NSPredicate *locationsPredicate = [NSPredicate predicateWithFormat:@"%K IN %@", NSStringFromSelector(@selector(dataId)), locationIds];

        NSArray<LocationManagedModel *> *locations = [LocationManagedModel MR_findAllWithPredicate:locationsPredicate inContext:localContext];

        [locations enumerateObjectsUsingBlock:^(LocationManagedModel *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            [obj MR_deleteEntityInContext:localContext];
        }];
    };

    [self saveWithBlock:executionBlock backgroundQueue:YES completion:completion];
}

+ (void)deleteAllLocationsWithCompletion:(nullable LTDataHelperVoidCompletionBlock)completion
{
    [self clearEntities:NSStringFromClass([UserManagedModel class]) withPredicate:nil inBackground:YES withCompletion:completion];
}

@end
