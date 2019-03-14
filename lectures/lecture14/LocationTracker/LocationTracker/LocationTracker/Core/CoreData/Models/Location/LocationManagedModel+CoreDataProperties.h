//
//  LocationManagedModel+CoreDataProperties.h
//
//
//  Created by Maksym Savisko on 5/14/17.
//
//

#import "LocationManagedModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface LocationManagedModel (CoreDataProperties)

+ (NSFetchRequest<LocationManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, copy) NSDate *createDate;
@property (nullable, nonatomic, copy) NSDate *locationDate;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nullable, nonatomic, retain) UserManagedModel *user;

@end

NS_ASSUME_NONNULL_END
