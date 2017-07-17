//
//  LabelHeightCell.h
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelHeightData+Layout.h"

@interface LabelHeightCell : UITableViewCell
+ (double)cellHeightForData:(LabelHeightData *)data;
- (void)configForData:(LabelHeightData *)data;
@end
