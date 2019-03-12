//
//  NSFetchedResultsController+LocationHistory.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (LocationHistory)

+ (nullable instancetype)lt_allLocationHistoryFetchedResultsControllerDelegate:(nullable id<NSFetchedResultsControllerDelegate>)delegate;

@end
