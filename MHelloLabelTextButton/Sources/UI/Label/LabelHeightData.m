//
//  LabelHeightData.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "LabelHeightData.h"

@interface LabelHeightData ()
@property (nonatomic) NSMutableDictionary *extraInfo;
@end

@implementation LabelHeightData

#pragma mark - Getter
- (NSMutableDictionary *)extraInfo {
    if (!_extraInfo) {
        _extraInfo = [NSMutableDictionary new];
    }
    
    return _extraInfo;
}

@end
