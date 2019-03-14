//
//  UserManagedModel+CoreDataProperties.m
//
//
//  Created by Maksym Savisko on 5/14/17.
//
//

#import "UserManagedModel+CoreDataProperties.h"

@implementation UserManagedModel (CoreDataProperties)

+ (NSFetchRequest<UserManagedModel *> *)fetchRequest
{
    return [[NSFetchRequest alloc] initWithEntityName:@"UserManagedModel"];
}

@dynamic dataId;
@dynamic locationHistory;

@end
