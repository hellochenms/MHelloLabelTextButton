//
//  LabelHeightCell.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "LabelHeightCell.h"
#import "LabelHeightCellLayout.h"
#import "LabelHeightData+Layout.h"

@interface LabelHeightCell ()
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UIView *bottomSeparator;
@property (nonatomic) LabelHeightData *data;
@property (nonatomic) LabelHeightCellLayout *layout;
@end

@implementation LabelHeightCell


#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.bottomSeparator];
    }
    
    return self;
}

#pragma mark - Layout
- (void)layoutSubviews {
    LabelHeightCellLayout *layout = [[self class] fetchOrGenerateLayoutForData:self.data];
    
    self.titleLabel.frame = layout.titleFrame;
    self.timeLabel.frame = layout.timeFrame;
    self.bottomSeparator.frame = layout.bottomSeparatorFrame;
}

#pragma mark - Public
+ (double)cellHeightForData:(LabelHeightData *)data {
    LabelHeightCellLayout *layout = [self fetchOrGenerateLayoutForData:data];
    
    return layout.cellHeight;
}

- (void)configForData:(LabelHeightData *)data {
    self.data = data;
    
    LabelHeightCellLayout *layout = [[self class] fetchOrGenerateLayoutForData:data];

    // @重点
    self.titleLabel.attributedText = layout.attributedTitle;
    // 设置attributedText后，再设置lineBreakMode才会生效
    // 直接在attributedText设置NSLineBreakByTruncatingTail，内容将不会换行
    // NSLineBreakByTruncatingTail和NSLineBreakByCharWrapping不兼容
    // NSLineBreakByTruncatingTail和NSLineBreakByWordWrapping兼容，NSLineBreakByWordWrapping是默认值，因此不需要给attributedText传lineBreakMode值
    // attributedText使用NSLineBreakByWordWrapping计算行高，和Label的NSLineBreakByTruncatingTail高度一致
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd";
    self.timeLabel.text = [formatter stringFromDate:[NSDate date]];
}


#pragma mark - Tools
+ (LabelHeightCellLayout *)fetchOrGenerateLayoutForData:(LabelHeightData *)data {
    LabelHeightCellLayout *layout = [data layout];
    if (!layout || ![layout isKindOfClass:[LabelHeightCellLayout class]]) {
        layout = [LabelHeightCellLayout new];
        [layout calcLayoutForData:data];
        [data saveLayout:layout];
        NSLog(@"【chenms】ID:%ld, 生成Layout  %s", data.ID,  __func__);
    } else {
        NSLog(@"【chenms】ID:%ld, 命中缓存Layout  %s", data.ID,  __func__);
    }
    
    return layout;
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = kLHCMaxLineCount;
        _titleLabel.backgroundColor = [UIColor brownColor];
    }
    
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [LabelHeightCellLayout timeFont];
    }
    
    return _timeLabel;
}

- (UIView *)bottomSeparator {
    if (!_bottomSeparator) {
        _bottomSeparator = [UIView new];
        _bottomSeparator.backgroundColor = [UIColor redColor];
    }
    
    return _bottomSeparator;
}

@end
