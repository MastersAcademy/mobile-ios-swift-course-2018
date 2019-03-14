//
//  LTHistoryCell.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTHistoryCell.h"
#import "LocationManagedModel.h"

#import "LTThemeHelper.h"
#import "NSDate+LTTimeAgo.h"

NSString *const LTHistoryCellIdentifier = @"historyCell";
CGFloat const LTHistoryCellDefaultHeight = 80;

@interface LTHistoryCell ()

@end

@implementation LTHistoryCell

#pragma mark - Public

- (void)addLocation:(LocationManagedModel *)location
{
    self.latitudeLabel.text = [NSString stringWithFormat:@"%@: %f", NSLocalizedString(@"Latitude", @"v1.0"), location.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%@: %f", NSLocalizedString(@"Longitude", @"v1.0"), location.longitude];
    self.dateLabel.text = [[NSDate lt_dateFormatter] stringFromDate:location.locationDate];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
}

- (void)setupUI
{
    [LTThemeHelper customizeCell:self];
}

@end
