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
- (double)m2_heightForSingleLineFont:(UIFont *)font;

// 任意行无行间距，maxLineCount为0视为不限制行数
- (double)m2_heightForFont:(UIFont *)font
                  maxWidth:(double)maxWidth
              maxLineCount:(NSInteger)maxLineCount;


// 任意行有行间距，maxLineCount为0视为不限制行数
// 使用本组方法计算行高的Label，必须使用本组方法生成的NSAttributedString
//// font & lineSpacing
- (NSAttributedString *)m2_attributedStringWithGoodLineSpaceForFont:(UIFont *)font
                                                        lineSpacing:(double)lineSpacing
                                                           maxWidth:(double)maxWidth
                                                       maxLineCount:(NSInteger)maxLineCount;
- (double)m2_heightWithGoodLineSpaceForFont:(UIFont *)font
                                lineSpacing:(double)lineSpacing
                                   maxWidth:(double)maxWidth
                               maxLineCount:(NSInteger)maxLineCount;
//// attributes
- (NSAttributedString *)m2_attributedStringWithGoodLineSpaceForAttributes:(NSDictionary *)attributes
                                                                 maxWidth:(double)maxWidth
                                                             maxLineCount:(NSInteger)maxLineCount;
- (double)m2_heightWithGoodLineSpaceForAttributes:(NSDictionary *)attributes
                                         maxWidth:(double)maxWidth
                                     maxLineCount:(NSInteger)maxLineCount;

// 【不推荐使用】伪精确行间距，只考虑两行汉字的行间距
// 任意行有行间距，maxLineCount为0视为不限制行数
// 根据字形图像高度间距计算，而非正常的印刷体行与行的间距
- (NSAttributedString *)m2_attributedStringWithChinesePreciseGoodLineSpaceForFont:(UIFont *)font
                                                                      lineSpacing:(double)lineSpacing
                                                                         maxWidth:(double)maxWidth
                                                                     maxLineCount:(NSInteger)maxLineCount;
- (double)m2_heightWithChinesePreciseGoodLineSpaceForFont:(UIFont *)font
                                              lineSpacing:(double)lineSpacing
                                                 maxWidth:(double)maxWidth
                                        maxLineCount:(NSInteger)maxLineCount;

@end
