//
//  LTCommonManagedModelProtocol.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class NSManagedObjectContext;

@protocol LTCommonManagedModelProtocol <NSObject>

- (void)createWithInfo:(nullable NSDictionary *)info inContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
