//
//  LTQueueHelper.h
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTQueueHelper : NSObject

+ (dispatch_queue_t)backgroundConcurrentQueue;

@end
