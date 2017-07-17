//
//  LabelHeightCellLayout.h
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelHeightData.h"

extern NSInteger const kLHCMaxLineCount;

// Layout类负责内容调整、样式设定（使用常量或方法）
// 本例简单起见，未在layout中处理time的串，实战中layout会从data中获取time并格式化
@interface LabelHeightCellLayout : NSObject
@property (nonatomic) double cellHeight;
@property (nonatomic) NSAttributedString *attributedTitle;
@property (nonatomic) CGRect titleFrame;
@property (nonatomic) CGRect timeFrame;
@property (nonatomic) CGRect bottomSeparatorFrame;

- (void)calcLayoutForData:(LabelHeightData *)data;
+ (UIFont *)timeFont;
@end
