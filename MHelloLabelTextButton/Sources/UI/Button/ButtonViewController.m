//
//  ButtonViewController.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/19.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "ButtonViewController.h"
#import "UIButton+M2InsetColor.h"

static double const kMargin = 20;
static double const kHeight = 50;

@interface ButtonViewController ()
@property (nonatomic) UIButton *imageTextDistanceButton;
@property (nonatomic) UIButton *imageTextLeftMarginButton;
@property (nonatomic) UIButton *imageLeftMarginTextDistanceButton;
@property (nonatomic) UIView *rightIcon;
@property (nonatomic) UIButton *textRightAlignButton;
@property (nonatomic) UIButton *imageTextVerticalButton;
@property (nonatomic) UIButton *textImageDistanceButton;
@property (nonatomic) UIButton *colorBgButton;
@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addMySubviews];
}

#pragma mark - Init
- (void)addMySubviews {
    [self.view addSubview:self.imageTextDistanceButton];
    [self.view addSubview:self.imageTextLeftMarginButton];
    [self.view addSubview:self.imageLeftMarginTextDistanceButton];
    [self.view addSubview:self.rightIcon];
    [self.view addSubview:self.textRightAlignButton];
    [self.view addSubview:self.imageTextVerticalButton];
    [self.view addSubview:self.textImageDistanceButton];
    [self.view addSubview:self.colorBgButton];
}

#pragma mark - Life Cycle
- (void)viewDidLayoutSubviews {
    [self layoutMySubviews];
}

#pragma mark - Layout
- (void)layoutMySubviews {
    double containerWidth = CGRectGetWidth(self.view.bounds);
    self.imageTextDistanceButton.frame = CGRectMake(kMargin, 64 + kMargin, containerWidth - kMargin * 2, kHeight);
    
    self.imageTextLeftMarginButton.frame = CGRectMake(kMargin, CGRectGetMaxY(self.imageTextDistanceButton.frame) + kMargin, containerWidth - kMargin * 2, kHeight);
    
    self.imageLeftMarginTextDistanceButton.frame = CGRectMake(kMargin, CGRectGetMaxY(self.imageTextLeftMarginButton.frame) + kMargin, containerWidth - kMargin * 2, kHeight);
    
    self.rightIcon.frame = CGRectMake(CGRectGetMaxX(self.imageLeftMarginTextDistanceButton.frame) - 50 - 50, CGRectGetMaxY(self.imageLeftMarginTextDistanceButton.frame) + kMargin, 50, 20);
    
    self.textRightAlignButton.frame = CGRectMake(kMargin, CGRectGetMaxY(self.rightIcon.frame) + kMargin, containerWidth - kMargin * 2, kHeight);
    
    self.imageTextVerticalButton.frame = CGRectMake(kMargin, CGRectGetMaxY(self.textRightAlignButton.frame) + kMargin, containerWidth - kMargin * 2, 100);
    // 需求：button的图标和文字上下排列，间距20
    [self.imageTextVerticalButton m2_layoutImageTitleVerticalForImageOffsetY:20 distance:20];
    
    self.textImageDistanceButton.frame = CGRectMake(kMargin, CGRectGetMaxY(self.imageTextVerticalButton.frame) + kMargin, containerWidth - kMargin * 2, kHeight);
    
    self.colorBgButton.frame = CGRectMake(kMargin, CGRectGetMaxY(self.textImageDistanceButton.frame) + kMargin, containerWidth - kMargin * 2, kHeight);
}

#pragma mark - Getter
- (UIButton *)imageTextDistanceButton {
    if (!_imageTextDistanceButton) {
        _imageTextDistanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageTextDistanceButton.backgroundColor = [UIColor brownColor];
        _imageTextDistanceButton.imageView.backgroundColor = [UIColor blueColor];
        [_imageTextDistanceButton setImage:[UIImage imageNamed:@"iOS"] forState:UIControlStateNormal];
        _imageTextDistanceButton.titleLabel.backgroundColor = [UIColor blueColor];
        [_imageTextDistanceButton setTitle:@"0123你好" forState:UIControlStateNormal];
        // 需求：button的图标和文字整体居中，且两者间距为50
        _imageTextDistanceButton.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
        _imageTextDistanceButton.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    }
    
    return _imageTextDistanceButton;
}

- (UIButton *)imageTextLeftMarginButton {
    if (!_imageTextLeftMarginButton) {
        _imageTextLeftMarginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageTextLeftMarginButton.backgroundColor = [UIColor brownColor];
        _imageTextLeftMarginButton.imageView.backgroundColor = [UIColor blueColor];
        [_imageTextLeftMarginButton setImage:[UIImage imageNamed:@"iOS"] forState:UIControlStateNormal];
        _imageTextLeftMarginButton.titleLabel.backgroundColor = [UIColor blueColor];
        [_imageTextLeftMarginButton setTitle:@"0123你好" forState:UIControlStateNormal];
        // 需求：button的图标距左边缘50，文字距左边缘150
        _imageTextLeftMarginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _imageTextLeftMarginButton.imageEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
        double imageWidth = _imageTextLeftMarginButton.imageView.image.size.width;
        _imageTextLeftMarginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 150 - imageWidth, 0, 0);
    }
    
    return _imageTextLeftMarginButton;
}

- (UIButton *)imageLeftMarginTextDistanceButton {
    if (!_imageLeftMarginTextDistanceButton) {
        _imageLeftMarginTextDistanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageLeftMarginTextDistanceButton.backgroundColor = [UIColor brownColor];
        _imageLeftMarginTextDistanceButton.imageView.backgroundColor = [UIColor blueColor];
        [_imageLeftMarginTextDistanceButton setImage:[UIImage imageNamed:@"iOS"] forState:UIControlStateNormal];
        _imageLeftMarginTextDistanceButton.titleLabel.backgroundColor = [UIColor blueColor];
        [_imageLeftMarginTextDistanceButton setTitle:@"0123你好" forState:UIControlStateNormal];
        // 需求：button的图标距左边缘50，文字距图标50
        _imageLeftMarginTextDistanceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        double imageOffsetX = 50;
        _imageLeftMarginTextDistanceButton.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffsetX, 0, 0);
        _imageLeftMarginTextDistanceButton.titleEdgeInsets = UIEdgeInsetsMake(0, imageOffsetX + 50, 0, 0);
    }
    
    return _imageLeftMarginTextDistanceButton;
}

- (UIView *)rightIcon {
    if (!_rightIcon) {
        _rightIcon = [UIView new];
        _rightIcon.backgroundColor = [UIColor brownColor];
    }
    
    return _rightIcon;
}

- (UIButton *)textRightAlignButton {
    if (!_textRightAlignButton) {
        _textRightAlignButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _textRightAlignButton.backgroundColor = [UIColor brownColor];
        _textRightAlignButton.titleLabel.backgroundColor = [UIColor blueColor];
        [_textRightAlignButton setTitle:@"0123你好" forState:UIControlStateNormal];
        // 需求：button的文字和上方图标右对齐，文字右边有额外50热区
        _textRightAlignButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _textRightAlignButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
    }
    
    return _textRightAlignButton;
}

- (UIButton *)imageTextVerticalButton {
    if (!_imageTextVerticalButton) {
        _imageTextVerticalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageTextVerticalButton.backgroundColor = [UIColor brownColor];
        _imageTextVerticalButton.imageView.backgroundColor = [UIColor blueColor];
        [_imageTextVerticalButton setImage:[UIImage imageNamed:@"iOS"] forState:UIControlStateNormal];
        _imageTextVerticalButton.titleLabel.backgroundColor = [UIColor blueColor];
        [_imageTextVerticalButton setTitle:@"0123你好" forState:UIControlStateNormal];
    }
    
    return _imageTextVerticalButton;
}

- (UIButton *)textImageDistanceButton {
    if (!_textImageDistanceButton) {
        _textImageDistanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _textImageDistanceButton.backgroundColor = [UIColor brownColor];
        _textImageDistanceButton.imageView.backgroundColor = [UIColor blueColor];
        [_textImageDistanceButton setImage:[UIImage imageNamed:@"iOS"] forState:UIControlStateNormal];
        _textImageDistanceButton.titleLabel.backgroundColor = [UIColor blueColor];
        [_textImageDistanceButton setTitle:@"0123你好0123你好0123你好" forState:UIControlStateNormal];
        [_textImageDistanceButton m2_layoutImageTitleForDistance:50];
    }
    
    return _textImageDistanceButton;
}



- (UIButton *)colorBgButton {
    if (!_colorBgButton) {
        _colorBgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_colorBgButton setImage:[UIImage imageNamed:@"iOS"] forState:UIControlStateNormal];
        [_colorBgButton setTitle:@"0123你好" forState:UIControlStateNormal];
        [_colorBgButton m2_setBackgroundColorHexRGBA:@"0000ffcc" forState:UIControlStateNormal];
        [_colorBgButton m2_setBackgroundColorHexRGB:@"ff0000" alpha:0.7 forState:UIControlStateHighlighted];
    }
    
    return _colorBgButton;
}

@end
