//
//  NSIndexPath+LTExtension.m
//  LocationTracker
//
//  Created by Maksym Savisko on 5/14/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "NSIndexPath+LTExtension.h"

@implementation NSIndexPath (LTExtension)

- (BOOL)lt_isEqualToIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return NO;
    }

    return self.section == indexPath.section && self.row == indexPath.row;
}

@end
