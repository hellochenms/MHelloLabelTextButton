//
//  UIFont+M2Size.m
//  MHelloLabelTextButton
//
//  Created by Chen,Meisong on 2017/12/24.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "UIFont+M2Size.h"

@implementation UIFont (M2Size)
- (double)m2_padding {
    double padding = (self.lineHeight - self.pointSize) / 2;
    
    return (padding > 0 ? padding : 0);
}


- (double)m2_lineSpacingWithUIMarkLineSpaing:(double)UIMarkLineSpaing {
    double lineSpacing = UIMarkLineSpaing - (self.lineHeight - self.pointSize);
    
    return (lineSpacing > 0 ? lineSpacing : 0);
}

@end
