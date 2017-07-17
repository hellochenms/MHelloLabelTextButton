//
//  LabelHeightData.h
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LabelHeightData : NSObject
@property (nonatomic) NSInteger ID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) NSMutableDictionary *extraInfo;
@end
