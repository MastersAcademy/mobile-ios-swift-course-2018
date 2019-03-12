//
//  LTDataHelper+Private.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper.h"
#import "LTDataHelperConstants.h"
#import "LTQueueHelper.h"
#import <MagicalRecord/MagicalRecord.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTDataHelper (Private)

+ (NSManagedObjectContext *)mainContext;
+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock;
+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock backgroundQueue:(BOOL)backgroundQueue;
+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock completion:(nullable LTDataHelperVoidCompletionBlock)completion;
+ (void)saveWithBlock:(LTDataHelperExecuteOnContextBlock)executionBlock backgroundQueue:(BOOL)backgroundQueue completion:(nullable LTDataHelperVoidCompletionBlock)completion;


@end


NS_ASSUME_NONNULL_END
