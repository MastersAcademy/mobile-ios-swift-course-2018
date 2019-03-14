//
//  UserManagedModel.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UserManagedModel.h"
#import "UserManagedModelKeys.h"
#import "LocationManagedModel.h"

@implementation UserManagedModel

- (void)createWithInfo:(NSDictionary *)info inContext:(NSManagedObjectContext *)context
{
    self.dataId = [info lt_getSecureStringForKey:UserDataIdKey defaultString:[NSString lt_uuidString]];
}

@end
