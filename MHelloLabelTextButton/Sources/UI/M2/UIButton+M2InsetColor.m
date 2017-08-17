//
//  UIButton+M2InsetColor.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "UIButton+M2InsetColor.h"

@implementation UIButton (M2InsetColor)
- (void)m2_layoutImageTitleVerticalForImageOffsetY:(double)imageOffsetY distance:(double)distance {
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    double buttonWidth = CGRectGetWidth(self.bounds);
    
    double imageWidth = CGRectGetWidth(self.imageView.bounds);
    double imageHeight = CGRectGetHeight(self.imageView.bounds);
    self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY,  (buttonWidth - imageWidth) / 2 , 0, 0);
    
    double titleWidth = CGRectGetWidth(self.titleLabel.bounds);
    self.titleEdgeInsets = UIEdgeInsetsMake(imageOffsetY + imageHeight + distance, (buttonWidth - titleWidth) / 2 - imageWidth, 0, 0);
}

- (void)m2_layoutImageTitleForDistance:(double)distance {
    double titleWidth = ceil([self.titleLabel sizeThatFits:CGSizeMake(10000, 10000)].width);
    
    NSLog(@"【chenms】titleWidth:%.1f  %s", titleWidth, __func__);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + distance / 2, 0, -(titleWidth + distance / 2));
    
    double imageWidth = ceil(self.imageView.image.size.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + distance / 2), 0, imageWidth + distance / 2);
    NSLog(@"【chenms】imageWidth:%.1f  %s", imageWidth, __func__);
}

- (void)m2_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state {
    UIImage *image = [self m2_imageForColor:color];
    [self setBackgroundImage:image forState:state];
}

- (void)m2_setBackgroundColorHexRGBA:(nullable NSString*)hexRGBA forState:(UIControlState)state {
    UIColor *color = [self m2_colorFromHexRGBA:hexRGBA];
    [self m2_setBackgroundColor:color forState:state];
}

- (void)m2_setBackgroundColorHexRGB:(nullable NSString*)hexRGB alpha:(double)alpha forState:(UIControlState)state {
    UIColor *color = [self m2_colorFromHexRGB:hexRGB alpha:alpha];
    [self m2_setBackgroundColor:color forState:state];
}

#pragma mark - Private
- (UIImage *)m2_imageForColor:(UIColor *)color {
    if (!color) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(1, 1));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIColor *)m2_colorFromHexRGBA:(NSString *)hexRGBA {
    if (!hexRGBA) {
        return nil;
    }
    
    if ([hexRGBA hasPrefix:@"0x"] ||
        [hexRGBA hasPrefix:@"0X"]) {
        hexRGBA = [hexRGBA substringFromIndex:2];
    }
    
    NSInteger hexLength = [hexRGBA length];
    if (hexLength != 6 && hexLength != 8) {
        return nil;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hexRGBA];
    unsigned int hexInt = 0;
    [scanner scanHexInt:&hexInt];
    
    NSInteger r = 0;
    NSInteger g = 0;
    NSInteger b = 0;
    NSInteger a = 0;
    if (hexLength == 6) {
        r = (0xff0000 & hexInt) >> 16;
        g = (0x00ff00 & hexInt) >> 8;
        b = 0x0000ff & hexInt;
        a = 255;
    } else if (hexLength == 8) {
        r = (0xff000000 & hexInt) >> 24;
        g = (0x00ff0000 & hexInt) >> 16;
        b = (0x0000ff00 & hexInt) >> 8;
        a = 0x000000ff & hexInt;
    }
    
    NSLog(@"【chenms】r:%ld g:%ld b:%ld  %s", r, g, b, __func__);
    
    UIColor *color = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a / 255.0];
    
    return color;
}

- (UIColor *)m2_colorFromHexRGB:(NSString *)hexRGB alpha:(double)alpha {
    if (!hexRGB) {
        return nil;
    }
    
    if ([hexRGB hasPrefix:@"0x"] ||
        [hexRGB hasPrefix:@"0X"]) {
        hexRGB = [hexRGB substringFromIndex:2];
    }
    
    if ([hexRGB length] != 6) {
        return nil;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hexRGB];
    unsigned int hexInt = 0;
    [scanner scanHexInt:&hexInt];
    
    NSInteger r = (0xff0000 & hexInt) >> 16;
    NSInteger g = (0x00ff00 & hexInt) >> 8;
    NSInteger b = 0x0000ff & hexInt;
    
    NSLog(@"【chenms】r:%ld g:%ld b:%ld  %s", r, g, b, __func__);
    
    UIColor *color = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
    
    return color;
}

@end
