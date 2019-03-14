//
//  LTDataHelper+Delete.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper.h"
#import "LTDataHelperConstants.h"

@interface LTDataHelper (Delete)

NS_ASSUME_NONNULL_BEGIN

+ (void)clearEntities:(NSString *)entityName withPredicate:(nullable NSPredicate *)predicate inBackground:(BOOL)background withCompletion:(nullable LTDataHelperVoidCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
