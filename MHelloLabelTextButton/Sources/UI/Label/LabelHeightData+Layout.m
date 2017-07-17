//
//  LabelHeightData+Layout.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "LabelHeightData+Layout.h"

static NSString * const kLHDLayoutKey = @"kLHDLayoutKey";

@implementation LabelHeightData (Layout)

- (void)saveLayout:(id)layout {
    if (!layout) {
        return;
    }
    [self.extraInfo setObject:layout forKey:kLHDLayoutKey];
}

- (id)layout {
    return [self.extraInfo objectForKey:kLHDLayoutKey];
}

- (void)clearLayout {
    [self.extraInfo removeObjectForKey:kLHDLayoutKey];
}

@end
