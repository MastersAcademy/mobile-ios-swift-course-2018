//
//  LTDataHelper+Setup.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper+Setup.h"
#import <MagicalRecord/MagicalRecord+Setup.h>
#import <MagicalRecord/MagicalRecord+Options.h>

NSString *const LTDataHelperCoreDataPath = @"LocationTracker.sqlite";

@implementation LTDataHelper (Setup)

#pragma mark - Public Methods

+ (void)setupCoreData
{
    [self setupWithCompletion:nil];
}

+ (void)setupWithCompletion:(LTDataHelperVoidCompletionBlock)completion
{
    [self setupAtStoreURL:[self applicationDatabaseURL] completion:completion];
}

+ (void)setupAtStoreURL:(nonnull NSURL *)storeUrl completion:(nullable LTDataHelperVoidCompletionBlock)completion
{
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelOff];
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreAtURL:storeUrl];

    if (completion) {
        completion();
    }
}

#pragma mark - Private Methods

+ (NSURL *)applicationDatabaseURL
{
    NSURL *documentsDirURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];

    return [documentsDirURL URLByAppendingPathComponent:LTDataHelperCoreDataPath];
}


@end
