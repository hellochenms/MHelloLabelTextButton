//
//  UIButton+M2InsetColor.h
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (M2InsetColor)
- (void)m2_layoutImageTitleVerticalForImageOffsetY:(double)imageOffsetY distance:(double)distance;
- (void)m2_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;
// 只支持RGB/RGBA写法，有无0x前缀都可以
- (void)m2_setBackgroundColorHexRGBA:(nullable NSString*)hexRGBA forState:(UIControlState)state;
- (void)m2_setBackgroundColorHexRGB:(nullable NSString*)hexRGB alpha:(double)alpha forState:(UIControlState)state;
@end
