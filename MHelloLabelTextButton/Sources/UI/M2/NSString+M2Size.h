//
//  NSString+M2Size.h
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (M2Size)

// 单行
- (double)m2_heightForSingleLineFont:(UIFont *)font
                             padding:(double *)padding;

// 任意行无行间距，maxLineCount为0视为不限制行数
- (double)m2_heightForFont:(UIFont *)font
                  maxWidth:(double)maxWidth
               maxLineCount:(NSInteger)maxLineCount
                    padding:(double *)padding;

// 任意行有行间距，maxLineCount为0视为不限制行数
// 使用本组方法计算行高的Label，必须使用本组方法生成的NSAttributedString
- (double)m2_heightForFont:(UIFont *)font
                lineSpacing:(double)lineSpacing
                   maxWidth:(double)maxWidth
               maxLineCount:(NSInteger)maxLineCount
           attributedString:(NSAttributedString **)attributedString
                    padding:(double *)padding;

@end
