//
//  LTHistoryViewController.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTHistoryViewController.h"
#import "NSIndexPath+LTExtension.h"
#import "LTHistoryCell.h"
#import "LTThemeHelper.h"
#import "LTDataHelper+Location.h"

#import "LocationManagedModel.h"
#import "NSFetchedResultsController+LocationHistory.h"
#import <CoreData/NSFetchedResultsController.h>

@interface LTHistoryViewController () <NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (nonatomic, strong) UIBarButtonItem *rightNavigationItem;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation LTHistoryViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];

    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
}

- (void)setupUI
{
    self.title = NSLocalizedString(@"Location History", @"v1.0");
    self.navigationController.tabBarItem.title = NSLocalizedString(@"History", @"v1.0");

    self.placeholderLabel.text = NSLocalizedString(@"No locations yet", @"v1.0");
    [LTThemeHelper customizeLabel:self.placeholderLabel];
    self.placeholderLabel.hidden = YES;
}

#pragma mark - Action Methods

- (void)deleteAllDidPressed
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"A you sure?", nil) message:NSLocalizedString(@"All location data will be deleted?", nil) preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *setting = [UIAlertAction actionWithTitle:NSLocalizedString(@"Delete All", nil)
                                                      style:UIAlertActionStyleDestructive
                                                    handler:^(UIAlertAction *_Nonnull action) {
                                                        [LTDataHelper deleteAllLocationsWithCompletion:^{
                                                            [self reloadDataForced];
                                                        }];
                                                    }];
    [alertController addAction:setting];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];

    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setBarButton:(UIBarButtonItem *)item animated:(BOOL)animated
{
    [self.navigationItem setRightBarButtonItem:item animated:animated];
}

#pragma mark - Data

- (void)reloadDataForced
{
    self.fetchedResultsController = nil;
    [self.tableView reloadData];
}

#pragma mark - Properties

- (UIBarButtonItem *)rightNavigationItem
{
    if (_rightNavigationItem == nil) {
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Delete", @"v1.0") style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllDidPressed)];
        [LTThemeHelper customizeDestructiveBarItem:rightButton];
        _rightNavigationItem = rightButton;
    }

    return _rightNavigationItem;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController) {
        return _fetchedResultsController;
    }

    _fetchedResultsController = [NSFetchedResultsController lt_allLocationHistoryFetchedResultsControllerDelegate:self];

    NSError *error = nil;
    if (![_fetchedResultsController performFetch:&error]) {
        abort();
    }

    return _fetchedResultsController;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger numberOfItems = self.fetchedResultsController.fetchedObjects.count;

    if (numberOfItems == 0) {
        [self setBarButton:nil animated:YES];
        self.placeholderLabel.hidden = NO;
    } else {
        [self setBarButton:self.rightNavigationItem animated:YES];
        self.placeholderLabel.hidden = YES;
    }

    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationManagedModel *item = self.fetchedResultsController.fetchedObjects[indexPath.row];

    LTHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:LTHistoryCellIdentifier];
    [cell addLocation:item];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LTHistoryCellDefaultHeight;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        LocationManagedModel *item = self.fetchedResultsController.fetchedObjects[indexPath.row];
        [LTDataHelper deleteLocationsByIds:@[ item.dataId ] withCompletion:nil];
    }
}

#pragma mark - NSFetchedResultsControllerDelegate Methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        }
        case NSFetchedResultsChangeMove: {
            if (![indexPath lt_isEqualToIndexPath:newIndexPath]) {
                [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
                [self.tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
        }
        case NSFetchedResultsChangeUpdate: {
            break;
        }
    }
}


@end
