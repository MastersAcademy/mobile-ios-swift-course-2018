//
//  LTQueueHelper.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "LTQueueHelper.h"

@implementation LTQueueHelper

+ (dispatch_queue_t)backgroundConcurrentQueue
{
    static dispatch_once_t onceToken;

    static dispatch_queue_t updatingQueue = nil;
    dispatch_once(&onceToken, ^{

        updatingQueue = dispatch_queue_create("com.LocationTracker.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    });

    return updatingQueue;
}

@end
