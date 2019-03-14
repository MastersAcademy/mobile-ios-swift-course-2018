//
//  LTDataHelper+Private.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper+Private.h"

@implementation LTDataHelper (Private)

+ (NSManagedObjectContext *)mainContext
{
    return [NSManagedObjectContext MR_defaultContext];
}

+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock
{
    [self saveWithBlock:executionBlock backgroundQueue:YES];
}

+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock backgroundQueue:(BOOL)backgroundQueue
{
    [self saveWithBlock:executionBlock backgroundQueue:backgroundQueue completion:nil];
}

+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock completion:(nullable LTDataHelperVoidCompletionBlock)completion
{
    [self saveWithBlock:executionBlock backgroundQueue:YES completion:completion];
}

+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock backgroundQueue:(BOOL)backgroundQueue completion:(nullable LTDataHelperVoidCompletionBlock)completion
{
    LTDataHelperVoidCompletionBlock backgroundExecuteBlock = ^{

        [MagicalRecord saveWithBlock:executionBlock
                          completion:^(BOOL contextDidSave, NSError *_Nullable error) {
                              if (completion) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      completion();
                                  });
                              }
                          }];
    };

    LTDataHelperVoidCompletionBlock executeBlock = ^{

        [MagicalRecord saveWithBlockAndWait:executionBlock];

        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        }
    };

    if (backgroundQueue) {
        dispatch_async([LTQueueHelper backgroundConcurrentQueue], backgroundExecuteBlock);
    } else {
        executeBlock();
    }
}

@end
