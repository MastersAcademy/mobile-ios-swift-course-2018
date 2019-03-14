//
//  NSFetchedResultsController+LocationHistory.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSFetchedResultsController+LocationHistory.h"
#import "LocationManagedModel.h"
#import "LTDataHelper+Private.h"

@implementation NSFetchedResultsController (LocationHistory)

+ (nullable instancetype)lt_allLocationHistoryFetchedResultsControllerDelegate:(nullable id<NSFetchedResultsControllerDelegate>)delegate
{
    NSFetchRequest *fetchRequest = [LocationManagedModel MR_requestAllSortedBy:NSStringFromSelector(@selector(locationDate)) ascending:NO inContext:[LTDataHelper mainContext]];


    NSFetchedResultsController *fetchController = [LocationManagedModel MR_fetchController:fetchRequest delegate:delegate useFileCache:NO groupedBy:nil inContext:[LTDataHelper mainContext]];

    return fetchController;
}

@end
