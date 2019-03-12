//
//  LTDataHelper+Delete.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper+Delete.h"
#import "LTDataHelper+Private.h"
#import "LTQueueHelper.h"

@implementation LTDataHelper (Delete)

+ (void)clearEntities:(NSString *)entityName withPredicate:(nullable NSPredicate *)predicate inBackground:(BOOL)background withCompletion:(nullable LTDataHelperVoidCompletionBlock)completion
{
    NSManagedObjectContext *_context = [self mainContext];

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [request setIncludesSubentities:NO];

    if (predicate) {
        [request setPredicate:predicate];
    }

    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];

    delete.resultType = NSBatchDeleteResultTypeCount;

    LTDataHelperVoidCompletionBlock executeBlock = ^{
        NSError *error = nil;
        NSBatchDeleteResult *result = [_context executeRequest:delete error:&error];
        if (result) {
            //
        }

        if (background) {
            [_context MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *_Nullable error) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion();
                    });
                }
            }];
        } else {
            [_context MR_saveToPersistentStoreAndWait];
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion();
                });
            }
        }
    };

    if (background) {
        dispatch_async([LTQueueHelper backgroundConcurrentQueue], executeBlock);
    } else {
        executeBlock();
    }
}

@end
