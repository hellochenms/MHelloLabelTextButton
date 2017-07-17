//
//  LabelViewController.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/13.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "LabelViewController.h"
#import <CoreText/CoreText.h>

static double const kMargin = 20;
static double const kLineSpace = 20;
static NSString * const kEnText = @"ABCDefg0123";
static NSString * const kEnCnText = @"ABCDefg0123你好世界";

@interface LabelViewController ()
@property (nonatomic) UILabel *systemEnLabel;
@property (nonatomic) UILabel *systemEnCnLabel;
@property (nonatomic) UILabel *systemEnCnFitLabel;
@property (nonatomic) UILabel *heitiSCEnCnLabel;
@property (nonatomic) UIImageView *fontImageView;
@end

@implementation LabelViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addMySubviews];
}

#pragma mark - Init
- (void)addMySubviews {
#warning @LabelViewController重点
    // 系统字体-无中文-设置行间距-单行，显示正常（单行不显示行间距）
    [self.view addSubview:self.systemEnLabel];
    // 系统字体-有中文-设置行间距-单行-设置Label高度为无行间距，显示不正常（单行向上偏移，底部还是留出了行间距）
    [self.view addSubview:self.systemEnCnLabel];
    // 系统字体-有中文-设置行间距-单行-Label自适应高度，显示不正常（单行显示行间距）
    [self.view addSubview:self.systemEnCnFitLabel];
    // 黑体简中文字体-有中文-设置行间距-单行，显示正常（单行不显示行间距）
    [self.view addSubview:self.heitiSCEnCnLabel];
    
    [self.view addSubview:self.fontImageView];
}

#pragma mark - Life Cycle
- (void)viewDidLayoutSubviews {
    [self layoutMySubviews];
}

#pragma mark - Layout
- (void)layoutMySubviews {
    double systemOneHeight = [@"1" boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:[self systemAttributes]
                                          context:nil].size.height;
    double labelWidth = CGRectGetWidth(self.view.bounds) - kMargin * 2;
    
    self.systemEnLabel.frame = CGRectMake(kMargin, 64 + kMargin, labelWidth, systemOneHeight);
    
    self.systemEnCnLabel.frame = CGRectMake(kMargin, CGRectGetMaxY(self.systemEnLabel.frame) + kMargin, labelWidth, systemOneHeight);
    
    [self.systemEnCnFitLabel sizeToFit];
    self.systemEnCnFitLabel.frame = CGRectMake(kMargin, CGRectGetMaxY(self.systemEnCnLabel.frame) + kMargin, labelWidth, CGRectGetHeight(self.systemEnCnFitLabel.bounds));
    
    double heitiSCOneHeight = [@"1" boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:[self heitiSCAttributes]
                                                context:nil].size.height;
    
    self.heitiSCEnCnLabel.frame = CGRectMake(kMargin, CGRectGetMaxY(self.systemEnCnFitLabel.frame) + kMargin, labelWidth, heitiSCOneHeight);
    
    // image
    double imageWidth = CGRectGetWidth(self.view.bounds) - kMargin * 2;
    double imageHeight = ceil(imageWidth * (self.fontImageView.image.size.height / self.fontImageView.image.size.width));
    self.fontImageView.frame = CGRectMake(kMargin, CGRectGetMaxY(self.heitiSCEnCnLabel.frame) + kMargin, imageWidth, imageHeight);
}


#pragma mark - Tools
// system
- (NSDictionary *)systemAttributes {
    NSMutableParagraphStyle *para = [NSMutableParagraphStyle new];
    para.lineSpacing = kLineSpace;
    
    return @{NSFontAttributeName: [self systemFont],
             NSParagraphStyleAttributeName: para};
}

- (UIFont *)systemFont {
    return [UIFont systemFontOfSize:20];
}

// Heiti SC
- (NSDictionary *)heitiSCAttributes {
    NSMutableParagraphStyle *para = [NSMutableParagraphStyle new];
    para.lineSpacing = kLineSpace;
    
    return @{NSFontAttributeName: [self heitiSCFont],
             NSParagraphStyleAttributeName: para};
}

- (UIFont *)heitiSCFont {
    return [UIFont fontWithName:@"Heiti SC" size:20];
}

#pragma mark - Getter
- (UILabel *)systemEnLabel {
    if (!_systemEnLabel) {
        _systemEnLabel = [UILabel new];
        _systemEnLabel.backgroundColor = [UIColor brownColor];
        _systemEnLabel.attributedText = [[NSAttributedString alloc] initWithString:kEnText attributes:[self systemAttributes]];
    }
    
    return _systemEnLabel;
}

- (UILabel *)systemEnCnLabel {
    if (!_systemEnCnLabel) {
        _systemEnCnLabel = [UILabel new];
        _systemEnCnLabel.backgroundColor = [UIColor brownColor];
        _systemEnCnLabel.attributedText = [[NSAttributedString alloc] initWithString:kEnCnText attributes:[self systemAttributes]];
    }
    
    return _systemEnCnLabel;
}

- (UILabel *)systemEnCnFitLabel {
    if (!_systemEnCnFitLabel) {
        _systemEnCnFitLabel = [UILabel new];
        _systemEnCnFitLabel.backgroundColor = [UIColor brownColor];
        _systemEnCnFitLabel.attributedText = [[NSAttributedString alloc] initWithString:kEnCnText attributes:[self systemAttributes]];
    }
    
    return _systemEnCnFitLabel;
}

- (UILabel *)heitiSCEnCnLabel {
    if (!_heitiSCEnCnLabel) {
        _heitiSCEnCnLabel = [UILabel new];
        _heitiSCEnCnLabel.backgroundColor = [UIColor brownColor];
        _heitiSCEnCnLabel.attributedText = [[NSAttributedString alloc] initWithString:kEnCnText attributes:[self heitiSCAttributes]];
    }
    
    return _heitiSCEnCnLabel;
}

- (UIImageView *)fontImageView {
    if (!_fontImageView) {
        _fontImageView = [UIImageView new];
        _fontImageView.image = [UIImage imageNamed:@"font"];
    }
    
    return _fontImageView;
}

@end
