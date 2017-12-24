//
//  PreciseSizeViewController.m
//  MHelloLabelTextButton
//
//  Created by Chen,Meisong on 2017/12/24.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "PreciseSizeViewController.h"
#import "NSString+M2Size.h"
#import "UIFont+desc.h"

@interface PreciseSizeViewController ()
@property (nonatomic) UIImageView *image0;
@property (nonatomic) UILabel *label0;
@property (nonatomic) UILabel *label1;
@property (nonatomic) UIImageView *image1;
@end

@implementation PreciseSizeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addMySubviews];
}

- (void)addMySubviews {
    [self.view addSubview:self.image0];
    [self.view addSubview:self.label0];
    [self.view addSubview:self.label1];
    [self.view addSubview:self.image1];
    
    [self.view bringSubviewToFront:self.label0];
    [self.view bringSubviewToFront:self.label1];
}

#pragma mark - Life Cycle
- (void)viewDidLayoutSubviews {
    [self layoutMySubviews];
}

#pragma mark - Layout
- (void)layoutMySubviews {
    double width = CGRectGetWidth(self.view.bounds);
    
    self.image0.frame = CGRectMake(100, 64, width - 100 * 2, 60);
    
    
    double label0Width = width - 60 * 2;
    NSAttributedString *label0AttrText = nil;
    double label0Padding = 0;
    double label0Height = [self.label0.text m2_heightForFont:self.label0.font
                                                 lineSpacing:10
                                                    maxWidth:label0Width
                                                maxLineCount:self.label0.numberOfLines attributedString:&label0AttrText
                                                     padding:&label0Padding];
    NSLog(@"【chenms】self.label0.font:%@  %s", [self.label0.font dsc_desc], __func__);
    NSLog(@"【chenms】label0Padding:%.1f  %s", label0Padding, __func__);
    self.label0.frame = CGRectMake(60, CGRectGetMaxY(self.image0.frame) - label0Padding, label0Width, label0Height);
    self.label0.attributedText = label0AttrText;
//    [self.label0 sizeToFit];
    

    double label1Width = width - 40 * 2;
    NSAttributedString *label1AttrText = nil;
    double label1Padding = 0;
    double label1Height = [self.label1.text m2_heightForFont:self.label1.font
                                                 lineSpacing:15
                                                    maxWidth:label1Width
                                                maxLineCount:self.label1.numberOfLines attributedString:&label1AttrText
                                                     padding:&label1Padding];
    self.label1.frame = CGRectMake(40, CGRectGetMaxY(self.label0.frame) - label0Padding - label1Padding, label1Width, label1Height);
    self.label1.attributedText = label1AttrText;
    self.label1.lineBreakMode = NSLineBreakByTruncatingTail;
//    [self.label1 sizeToFit];
    
    self.image1.frame = CGRectMake(100, CGRectGetMaxY(self.label1.frame) - label1Padding, width - 100 * 2, 60);
}

- (UIImageView *)image0 {
    if(!_image0){
        _image0 = [UIImageView new];
        _image0.backgroundColor = [UIColor brownColor];
    }

    return _image0;
}

- (UILabel *)label0{
    if(!_label0){
        _label0 = [[UILabel alloc] init];
        _label0.backgroundColor = [UIColor redColor];
        _label0.numberOfLines = 0;
        _label0.font = [UIFont systemFontOfSize:20];
        _label0.text = @"中pppp中QWE中中中中pppp中中中中pppp中中中中pppp中中中中pppp中中中中pppp中中中中pppp";
//        _label0.text = @"中pppp中QWE中中";
        _label0.alpha = 0.6;
    }
    return _label0;
}

- (UILabel *)label1{
    if(!_label1){
        _label1 = [[UILabel alloc] init];
        _label1.backgroundColor = [UIColor blueColor];
        _label1.numberOfLines = 3;
        _label1.font = [UIFont systemFontOfSize:30];
        _label1.text = @"中中中中ppppQWE中中中中pppp中中中中pppp中中中中pppp中中中中pppp中中中中pppp中中中中pppp";
        _label1.alpha = 0.6;
    }
    return _label1;
}

- (UIImageView *)image1 {
    if(!_image1){
        _image1 = [UIImageView new];
        _image1.backgroundColor = [UIColor brownColor];
        
    }

    return _image1;
}

@end
