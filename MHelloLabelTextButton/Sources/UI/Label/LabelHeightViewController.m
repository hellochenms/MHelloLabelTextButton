//
//  LabelHeightViewController.m
//  MHelloLabelTextButton
//
//  Created by chenms on 17/7/15.
//  Copyright © 2017年 chenms.m2. All rights reserved.
//

#import "LabelHeightViewController.h"
#import "M7TempDataGenerator.h"
#import "LabelHeightCell.h"
#import "LabelHeightData+Layout.h"

@interface LabelHeightViewController (Table)<UITableViewDataSource, UITableViewDelegate>
- (void)initDatas;
@end

@interface LabelHeightViewController ()
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray<LabelHeightData *> *datas;
@end

@implementation LabelHeightViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initDatas];
    [self addMySubviews];
}

#pragma mark - Init
- (void)addMySubviews {
    UIBarButtonItem *clearLayoutItem
    = [[UIBarButtonItem alloc] initWithTitle:@"清除Cell布局缓存"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(onTapClearLayout)];
 
    self.navigationItem.rightBarButtonItem = clearLayoutItem;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Life Cycle
- (void)viewWillLayoutSubviews {
    self.tableView.frame = self.view.bounds;
}

#pragma mark - Event
- (void)onTapClearLayout {
    [self.datas enumerateObjectsUsingBlock:^(LabelHeightData * _Nonnull data, NSUInteger idx, BOOL * _Nonnull stop) {
        [data clearLayout];
    }];
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

@end

#pragma mark -
#pragma mark - LabelHeightViewController (Table)
@implementation LabelHeightViewController (Table)
#pragma mark - Init
- (void)initDatas {
    NSArray<NSString *> *textArray = [M7TempDataGenerator textArray];
    NSMutableArray<LabelHeightData *> *dataArray = [NSMutableArray new];
    
    [textArray enumerateObjectsUsingBlock:^(NSString * _Nonnull text, NSUInteger idx, BOOL * _Nonnull stop) {
        LabelHeightData *data = [LabelHeightData new];
        data.ID = idx;
        data.title = text;
        [dataArray addObject:data];
    }];
    
    self.datas = dataArray;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    LabelHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[LabelHeightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    LabelHeightData *data = self.datas[indexPath.row];
    [cell configForData:data];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LabelHeightData *data = self.datas[indexPath.row];
    
    return [LabelHeightCell cellHeightForData:data];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
