//
//  LabelHeightCellLayout.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "LabelHeightCellLayout.h"
#import "NSString+M2Size.h"

NSInteger const kLHCMaxLineCount = 2;
static double const kLineSpace = 20;

@implementation LabelHeightCellLayout

#pragma mark - Public
// 约束宽度默认为屏幕宽，实战中可能有设计宽度
- (void)calcLayoutForData:(LabelHeightData *)data {
    [self calcLayoutForData:data containerWidth:CGRectGetWidth([UIScreen mainScreen].bounds)];
}

#pragma mark - Calc layout
- (void)calcLayoutForData:(LabelHeightData *)data containerWidth:(double)containerWidth {
    NSString *title = data.title;
    NSMutableAttributedString *attributedTitle = nil;
    double titleHeight = [self titleHeightForTitle:title
                                  attributedString:&attributedTitle];
    self.attributedTitle = attributedTitle;
    self.titleFrame = CGRectMake(0, 0, containerWidth, titleHeight);
    
    
    double timeHeight = [self timeHeight];
    self.timeFrame = CGRectMake(0, CGRectGetMaxY(self.titleFrame), containerWidth, timeHeight);
    
    double bottomSeparatorHeight = 1;
    self.bottomSeparatorFrame = CGRectMake(0, CGRectGetMaxY(self.timeFrame) - bottomSeparatorHeight, containerWidth, bottomSeparatorHeight);
    
    self.cellHeight = CGRectGetMaxY(self.bottomSeparatorFrame);
}

- (double)titleHeightForTitle:(NSString *)title
             attributedString:(NSMutableAttributedString **)attributedString {
    if (!title) {
        return 0;
    }
    
    double height = [title m2_heightForFont:[self titleFont]
                                lineSpacing:kLineSpace
                                   maxWidth:CGRectGetWidth([UIScreen mainScreen].bounds)
                               maxLineCount:kLHCMaxLineCount
                           attributedString:attributedString
                                    padding:nil];
    
    return height;
}

- (double)timeHeight {
    return [@"1" m2_heightForSingleLineFont:[[self class] timeFont] padding:nil];
}

#pragma mark - Content & Style
- (UIFont *)titleFont {
    return [UIFont systemFontOfSize:20];
}

+ (UIFont *)timeFont {
    return [UIFont systemFontOfSize:20];
}

@end
