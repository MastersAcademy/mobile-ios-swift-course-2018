//
//  LocationManagedModel+CoreDataProperties.m
//
//
//  Created by Maksym Savisko on 5/14/17.
//
//

#import "LocationManagedModel+CoreDataProperties.h"

@implementation LocationManagedModel (CoreDataProperties)

+ (NSFetchRequest<LocationManagedModel *> *)fetchRequest
{
    return [[NSFetchRequest alloc] initWithEntityName:@"LocationManagedModel"];
}

@dynamic dataId;
@dynamic createDate;
@dynamic locationDate;
@dynamic latitude;
@dynamic longitude;
@dynamic user;

@end
