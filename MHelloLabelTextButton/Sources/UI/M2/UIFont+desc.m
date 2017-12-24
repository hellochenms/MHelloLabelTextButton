//
//  UIFont+desc.m
//  HelloHelloLabel
//
//  Created by Chen,Meisong on 2017/12/23.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "UIFont+desc.h"

@implementation UIFont (desc)
- (NSString *)dsc_desc {
    NSMutableString *text = [NSMutableString string];
//    [text appendFormat:@"familyName=%@; ", self.familyName];
//    [text appendFormat:@"fontName=%@; ", self.fontName];
    [text appendFormat:@"lineHeight=%.1f; ", self.lineHeight];
    [text appendFormat:@"pointSize=%.1f; ", self.pointSize];
    [text appendFormat:@"ascender=%.1f; ", self.ascender];
    [text appendFormat:@"descender=%.1f; ", self.descender];
    [text appendFormat:@"capHeight=%.1f; ", self.capHeight];
    [text appendFormat:@"xHeight=%.1f; ", self.xHeight];
    [text appendFormat:@"leading=%.1f; ", self.leading];
    
    return text;
}

@end
