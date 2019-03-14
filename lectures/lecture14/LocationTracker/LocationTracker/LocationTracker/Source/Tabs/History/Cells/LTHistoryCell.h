//
//  LTHistoryCell.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationManagedModel;

NS_ASSUME_NONNULL_BEGIN

extern NSString *const LTHistoryCellIdentifier;
extern CGFloat const LTHistoryCellDefaultHeight;

@interface LTHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

- (void)addLocation:(LocationManagedModel *)location;

@end

NS_ASSUME_NONNULL_END
