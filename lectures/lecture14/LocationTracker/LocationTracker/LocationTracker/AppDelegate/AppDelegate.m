//
//  AppDelegate.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "AppDelegate.h"
#import "LTDataHelper+Setup.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [LTDataHelper setupCoreData];
    return YES;
}


@end
