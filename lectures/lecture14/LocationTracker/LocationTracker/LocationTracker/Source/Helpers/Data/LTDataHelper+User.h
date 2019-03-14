//
//  LTDataHelper+User.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTDataHelper.h"
#import "UserManagedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LTDataHelper (User)

+ (UserManagedModel *)currentUserModelInContext:(NSManagedObjectContext *)context;

+ (UserManagedModel *)currentUserModel;

@end

NS_ASSUME_NONNULL_END
