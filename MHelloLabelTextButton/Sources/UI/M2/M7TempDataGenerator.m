//
//  M2TempDataGenerator.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "M7TempDataGenerator.h"

static NSInteger const kCount = 40;

@implementation M7TempDataGenerator
#pragma mark - text array
+ (NSArray *)textArray {
    return [self textArrayForCount:kCount];
}

+ (NSArray *)textArrayForCount:(NSInteger)count {
    // guard
    if (count <= 0) {
        count = kCount;
    }
    
    // datas
    NSMutableArray *datas = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count; i++) {
        NSMutableString *text = [NSMutableString stringWithString:@"^"];
        NSInteger count = arc4random() % 10 + 1;
        for (NSInteger i = 0; i < count; i++) {
            [text appendString:@"ABCDefg0123你好世界"];
        }
        [text appendString:@"$"];
        [datas addObject:[text copy]];
    }
    
    return [datas copy];
}

@end
