//
//  LTLauncherViewController.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTLauncherViewController.h"
#import "LTThemeHelper.h"
#import "LocationTracker.h"
#import "LTDataHelper+Location.h"

@interface LTLauncherViewController () <LocationTrackerObserver>
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (nonatomic, strong) LocationTracker *locationTracker;

@end

@implementation LTLauncherViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];

    self.locationTracker = [LocationTracker defaultTracker];
    [self.locationTracker addObserver:self];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [LTThemeHelper customizeLayoutButton:self.actionButton];
}

- (void)dealloc
{
    [self.locationTracker removeObserver:self];
}

- (void)setupUI
{
    self.title = NSLocalizedString(@"Launcher", @"v1.0");
    self.navigationController.tabBarItem.title = NSLocalizedString(@"Launcher", @"v1.0");

    [self.actionButton setTitle:NSLocalizedString(@"Start tracking", @"v1.0") forState:UIControlStateNormal];
    [LTThemeHelper customizeButton:self.actionButton];
}

#pragma mark - Action Methods

- (IBAction)actionButtonDidPressed:(id)sender
{
    if (self.locationTracker.isStarted) {
        [self.locationTracker stop];
        [self.actionButton setTitle:NSLocalizedString(@"Start tracking", @"v1.0") forState:UIControlStateNormal];
    } else {
        if ([LocationTracker isLocationServiceRequested] && ![LocationTracker isServiceEnabled]) {
            [self showSettingsAlert];
        } else {
            [self.locationTracker start];
            [self.actionButton setTitle:NSLocalizedString(@"Stop tracking", @"v1.0") forState:UIControlStateNormal];
        }
    }
}

#pragma mark - LocationTrackerObserver Methods

- (void)onLocationUpdate:(CLLocation *)location
{
    [LTDataHelper saveLocations:@[ location ] withCompletion:nil];
}

- (void)onLocationError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        [self actionButtonDidPressed:nil];
        [self showSettingsAlert];
    }
}

#pragma mark - Alets

- (void)showSettingsAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"Please, enable location service", nil) preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *setting = [UIAlertAction actionWithTitle:NSLocalizedString(@"Settings", nil)
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction *_Nonnull action) {
                                                        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                                        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                                                    }];
    [alertController addAction:setting];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];

    [self presentViewController:alertController animated:YES completion:nil];
}

@end
