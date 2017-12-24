//
//  NSString+M2Size.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "NSString+M2Size.h"
#import "UIFont+M2Size.h"

static NSString * const kOneLineText = @"中p";

@implementation NSString (M2Size)

#pragma mark - 单行
- (double)m2_heightForSingleLineFont:(UIFont *)font
                             padding:(double *)padding {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    double oneHeight = ceil([kOneLineText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:attributes
                                                       context:nil].size.height);
    
    if (padding) {
        *padding = [font m2_padding];
    }
    
    return oneHeight;
}

#pragma mark - 任意行无行间距，maxLineCount为0视为不限制行数
- (double)m2_heightForFont:(UIFont *)font
                   maxWidth:(double)maxWidth
               maxLineCount:(NSInteger)maxLineCount
                    padding:(double *)padding {
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
    
    if (padding) {
        *padding = [font m2_padding];
    }
    
    return height;
}

#pragma mark - 任意行有行间距，maxLineCount为0视为不限制行数
- (double)m2_heightForFont:(UIFont *)font
                                lineSpacing:(double)lineSpacing
                                   maxWidth:(double)maxWidth
                               maxLineCount:(NSInteger)maxLineCount
                           attributedString:(NSAttributedString **)attributedString
                                    padding:(double *)padding {
    // Attributes
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    if (font) {
        [attributes setObject:font forKey:NSFontAttributeName];
    }
    if (lineSpacing > 0) {
        NSMutableParagraphStyle *para = [NSMutableParagraphStyle new];
        para.lineSpacing = [font m2_lineSpacingWithUIMarkLineSpaing:lineSpacing];
        [attributes setObject:para forKey:NSParagraphStyleAttributeName];
    }
    
    // Check
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
    
    // Max Height
    double innerMaxHeight = MAXFLOAT;
    NSMutableDictionary *oneLineAttributes = [attributes mutableCopy];
    [oneLineAttributes removeObjectForKey:NSParagraphStyleAttributeName];
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine;
    double oneHeight = ceil([kOneLineText boundingRectWithSize:CGSizeMake(innerMaxWidth, MAXFLOAT)
                                                       options:options
                                                    attributes:oneLineAttributes
                                                       context:nil].size.height);
    if (innerMaxLineCount > 0) {
        innerMaxHeight = oneHeight * innerMaxLineCount + innerLineSpace * (innerMaxLineCount - 1);
    }
    
    // Height
    double height = ceil([self boundingRectWithSize:CGSizeMake(innerMaxWidth, innerMaxHeight)
                                            options:options
                                         attributes:attributes
                                            context:nil].size.height);
    
    // 如果是1行并且带有行间距，则去除行间距
    if (((NSInteger)height == (NSInteger)oneHeight + innerLineSpace)
        && innerLineSpace > 0) {
        // height
        height -= innerLineSpace;
        
        // attributes
        NSMutableParagraphStyle *para = [[attributes objectForKey:NSParagraphStyleAttributeName] mutableCopy];
        para.lineSpacing = 0;
        NSMutableDictionary *mutableAttributes = [attributes mutableCopy];
        [mutableAttributes setObject:para forKey:NSParagraphStyleAttributeName];
        attributes = mutableAttributes;
    }
    
    NSAttributedString *innerAttributedString = [[NSAttributedString alloc] initWithString:self attributes:attributes];
    
    if (attributedString) {
        *attributedString = innerAttributedString;
    }
    
    if (padding) {
        *padding = [font m2_padding];
    }
    
    return height;
}

@end
