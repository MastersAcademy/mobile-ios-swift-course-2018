//
//  LTDataHelper+Setup.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper.h"
#import "LTDataHelperConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface LTDataHelper (Setup)

+ (void)setupCoreData;
+ (void)setupWithCompletion:(nullable LTDataHelperVoidCompletionBlock)completion;
+ (void)setupAtStoreURL:(nonnull NSURL *)storeUrl completion:(nullable LTDataHelperVoidCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
