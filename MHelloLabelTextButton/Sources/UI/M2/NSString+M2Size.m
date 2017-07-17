//
//  NSString+M2Size.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "NSString+M2Size.h"

static NSString * const kOneLineText = @"A";
static NSString * const kChineseOneLineText = @"你";

@implementation NSString (M2Size)

#pragma mark - 单行
- (double)m2_heightForSingleLineFont:(UIFont *)font {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    double oneHeight = ceil([kOneLineText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:attributes
                                                       context:nil].size.height);
    
    return oneHeight;
}

#pragma mark - 任意行无行间距，maxLineCount为0视为不限制行数
- (double)m2_heightForFont:(UIFont *)font
                  maxWidth:(double)maxWidth
              maxLineCount:(NSInteger)maxLineCount {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    
    double innerMaxWidth = MAXFLOAT;
    if (maxWidth > 0) {
        innerMaxWidth = maxWidth;
    }
    
    NSInteger innerMaxLineCount = 0;
    if (maxLineCount > 0) {
        innerMaxLineCount = maxLineCount;
    }
    
    // max height
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine;
    
    double innerMaxHeight = MAXFLOAT;
    double oneHeight = ceil([kOneLineText boundingRectWithSize:CGSizeMake(innerMaxWidth, MAXFLOAT)
                                               options:options
                                            attributes:attributes
                                               context:nil].size.height);
    if (innerMaxLineCount > 0) {
        innerMaxHeight = oneHeight * innerMaxLineCount;
    }
    
    // height
    double height = ceil([self boundingRectWithSize:CGSizeMake(innerMaxWidth, innerMaxHeight)
                                            options:options
                                         attributes:attributes
                                            context:nil].size.height);
    
    return height;
}

#pragma mark - 任意行有行间距，maxLineCount为0视为不限制行数
#pragma mark Font & lineSpacing
- (NSAttributedString *)m2_attributedStringWithGoodLineSpaceForFont:(UIFont *)font
                                                        lineSpacing:(double)lineSpacing
                                                           maxWidth:(double)maxWidth
                                                       maxLineCount:(NSInteger)maxLineCount {
    NSDictionary *attributes = [self attributesForFont:font lineSpacing:lineSpacing];

    return [self m2_attributedStringWithGoodLineSpaceForAttributes:attributes
                                                          maxWidth:maxWidth
                                                      maxLineCount:maxLineCount];
}

- (double)m2_heightWithGoodLineSpaceForFont:(UIFont *)font
                                lineSpacing:(double)lineSpacing
                                   maxWidth:(double)maxWidth
                               maxLineCount:(NSInteger)maxLineCount {
    NSDictionary *attributes = [self attributesForFont:font lineSpacing:lineSpacing];
    
    return [self m2_heightWithGoodLineSpaceForAttributes:attributes
                                                maxWidth:maxWidth
                                            maxLineCount:maxLineCount];
}

- (NSDictionary *)attributesForFont:(UIFont *)font lineSpacing:(double)lineSpacing {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    if (lineSpacing > 0) {
        NSMutableParagraphStyle *para = [NSMutableParagraphStyle new];
        para.lineSpacing = lineSpacing;
        [attributes setObject:para forKey:NSParagraphStyleAttributeName];
    }
    
    return attributes;
}

#pragma mark Attributes
- (NSAttributedString *)m2_attributedStringWithGoodLineSpaceForAttributes:(NSDictionary *)attributes
                                                                 maxWidth:(double)maxWidth
                                                             maxLineCount:(NSInteger)maxLineCount {
    NSParagraphStyle *para = [attributes objectForKey:NSParagraphStyleAttributeName];
    NSInteger innerLineSpace = 0;
    if (para && para.lineSpacing > 0) {
        innerLineSpace = para.lineSpacing;
    }
    
    double innerMaxWidth = MAXFLOAT;
    if (maxWidth > 0) {
        innerMaxWidth = maxWidth;
    }
    
    NSInteger innerMaxLineCount = 0;
    if (maxLineCount > 0) {
        innerMaxLineCount = maxLineCount;
    }
    
    // max height
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine;
    
    double innerMaxHeight = MAXFLOAT;
    double oneHeight = ceil([kOneLineText boundingRectWithSize:CGSizeMake(innerMaxWidth, MAXFLOAT)
                                               options:options
                                            attributes:attributes
                                               context:nil].size.height);
    if (innerMaxLineCount > 0) {
        innerMaxHeight = oneHeight * innerMaxLineCount + innerLineSpace * (innerMaxLineCount - 1);
    }
    
    // height
    double height = ceil([self boundingRectWithSize:CGSizeMake(innerMaxWidth, innerMaxHeight)
                                            options:options
                                         attributes:attributes
                                            context:nil].size.height);
    
    // 如果是1行并且带有行间距，则去除行间距
    if (((NSInteger)height == (NSInteger)oneHeight + innerLineSpace) && innerLineSpace > 0) {
        NSMutableParagraphStyle *para = [[attributes objectForKey:NSParagraphStyleAttributeName] mutableCopy];
        para.lineSpacing = 0;
        NSMutableDictionary *mutableAttributes = [attributes mutableCopy];
        [mutableAttributes setObject:para forKey:NSParagraphStyleAttributeName];
        attributes = mutableAttributes;
    }
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self attributes:attributes];
    
    return attributedString;
}

- (double)m2_heightWithGoodLineSpaceForAttributes:(NSDictionary *)attributes
                                         maxWidth:(double)maxWidth
                                     maxLineCount:(NSInteger)maxLineCount {
    NSParagraphStyle *para = [attributes objectForKey:NSParagraphStyleAttributeName];
    NSInteger innerLineSpace = 0;
    if (para && para.lineSpacing > 0) {
        innerLineSpace = para.lineSpacing;
    }
    
    double innerMaxWidth = MAXFLOAT;
    if (maxWidth > 0) {
        innerMaxWidth = maxWidth;
    }
    
    NSInteger innerMaxLineCount = 0;
    if (maxLineCount > 0) {
        innerMaxLineCount = maxLineCount;
    }
    
    // max height
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine;
    
    double innerMaxHeight = MAXFLOAT;
    double oneHeight = ceil([kOneLineText boundingRectWithSize:CGSizeMake(innerMaxWidth, MAXFLOAT)
                                               options:options
                                            attributes:attributes
                                               context:nil].size.height);
    if (innerMaxLineCount > 0) {
        innerMaxHeight = oneHeight * innerMaxLineCount + innerLineSpace * (innerMaxLineCount - 1);
    }
    
    // height
    double height = ceil([self boundingRectWithSize:CGSizeMake(innerMaxWidth, innerMaxHeight)
                                            options:options
                                         attributes:attributes
                                            context:nil].size.height);
    
    // 如果是1行并且带有行间距，则去除行间距
    if ((NSInteger)height == (NSInteger)oneHeight + innerLineSpace) {
        height -= innerLineSpace;
    }
    
    return height;
}

#pragma mark - 【不推荐使用】伪精确行间距，只考虑两行汉字的行间距；任意行有行间距，maxLineCount为0视为不限制行数，根据字形图像高度间距计算，而非正常的印刷体行与行的间距
- (NSAttributedString *)m2_attributedStringWithChinesePreciseGoodLineSpaceForFont:(UIFont *)font
                                                                      lineSpacing:(double)lineSpacing
                                                                         maxWidth:(double)maxWidth
                                                                     maxLineCount:(NSInteger)maxLineCount {
    NSDictionary *attributes = [self chinesePreciseAttributesForFont:font lineSpacing:lineSpacing];
    
    return [self m2_attributedStringWithGoodLineSpaceForAttributes:attributes
                                                          maxWidth:maxWidth
                                                      maxLineCount:maxLineCount];
}

- (double)m2_heightWithChinesePreciseGoodLineSpaceForFont:(UIFont *)font
                                              lineSpacing:(double)lineSpacing
                                                 maxWidth:(double)maxWidth
                                             maxLineCount:(NSInteger)maxLineCount {
    NSDictionary *attributes = [self chinesePreciseAttributesForFont:font lineSpacing:lineSpacing];
    
    return [self m2_heightWithGoodLineSpaceForAttributes:attributes
                                                maxWidth:maxWidth
                                            maxLineCount:maxLineCount];
}

- (NSDictionary *)chinesePreciseAttributesForFont:(UIFont *)font lineSpacing:(double)lineSpacing {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    if (lineSpacing > 0) {
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine;
        double oneHeight = ceil([kChineseOneLineText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                                  options:options
                                                               attributes:attributes
                                                                  context:nil].size.height);
        double onePreciseHeight = ceil([kChineseOneLineText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                                         options:NSStringDrawingUsesDeviceMetrics
                                                                      attributes:attributes
                                                                         context:nil].size.height);
        
        double topAndBottomPadding = ceil(oneHeight - onePreciseHeight);
        
        NSMutableParagraphStyle *para = [NSMutableParagraphStyle new];
        // 行间距减去上一行的底部Padding和下一行的顶部Padding
        para.lineSpacing = lineSpacing - topAndBottomPadding;
        [attributes setObject:para forKey:NSParagraphStyleAttributeName];
    }
    
    return attributes;
}

@end
