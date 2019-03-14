//
//  UserManagedModel+CoreDataProperties.h
//
//
//  Created by Maksym Savisko on 5/14/17.
//
//

#import "UserManagedModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserManagedModel (CoreDataProperties)

+ (NSFetchRequest<UserManagedModel *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *dataId;
@property (nullable, nonatomic, retain) NSSet<LocationManagedModel *> *locationHistory;

@end

@interface UserManagedModel (CoreDataGeneratedAccessors)

- (void)addLocationHistoryObject:(LocationManagedModel *)value;
- (void)removeLocationHistoryObject:(LocationManagedModel *)value;
- (void)addLocationHistory:(NSSet<LocationManagedModel *> *)values;
- (void)removeLocationHistory:(NSSet<LocationManagedModel *> *)values;

@end

NS_ASSUME_NONNULL_END
