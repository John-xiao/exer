//
//  Demo2ImageBrowserViewController.m
//  exer
//
//  Created by 肖君 on 16/1/28.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo2ImageBrowserViewController.h"

@interface Demo2ImageBrowserViewController ()
@property(nonatomic, strong) UIImageView *displayView;
@property (nonatomic,strong) UIImageView *animationView;
@property(nonatomic, strong) UILabel *indexLable;
@property(nonatomic, strong) UILabel *descLable;
@end

@implementation Demo2ImageBrowserViewController

typedef enum { kPrevious = 0, kNext, kPlay } btnTag;

- (ImageBrowserViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ImageBrowserViewModel alloc] init];
    }
    return _viewModel;
}

- (UIImageView *)displayView {
    if (!_displayView) {
        _displayView = [[UIImageView alloc] init];
        _displayView.backgroundColor = [UIColor orangeColor];
    }
    return _displayView;
}

- (UIImageView *)animationView {
    if (!_animationView) {
        _animationView = [[UIImageView alloc] init];
        _animationView.backgroundColor = [UIColor orangeColor];
    }
    return _animationView;
}

- (UILabel *)indexLable {
    if (!_indexLable) {
        _indexLable = [[UILabel alloc] init];
        _indexLable.backgroundColor = [UIColor grayColor];
    }
    return _indexLable;
}

- (UILabel *)descLable {
    if (!_descLable) {
        _descLable = [[UILabel alloc] init];
        _descLable.backgroundColor = [UIColor grayColor];
    }
    return _descLable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.viewModel loadData];
    [self setupView];
    [self loadViewData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    UIButton *preBtn = [[UIButton alloc] init];
    [preBtn setTitle:@"PRE" forState:UIControlStateNormal];
    preBtn.backgroundColor = [UIColor grayColor];
    [preBtn setTag:kPrevious];
    UIButton *nextBtn = [[UIButton alloc] init];
    [nextBtn setTitle:@"NEXT" forState:UIControlStateNormal];
    nextBtn.backgroundColor = [UIColor grayColor];
    [nextBtn setTag:kNext];

    [preBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.indexLable];
    [self.indexLable mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.view.mas_top).mas_offset(10);
      make.centerX.mas_equalTo(self.view.mas_centerX);
      make.height.mas_equalTo(40);
    }];

    [self.view addSubview:preBtn];
    [self.view addSubview:self.displayView];
    [self.view addSubview:nextBtn];
    [preBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.mas_equalTo(self.displayView.mas_centerY);
      make.left.mas_equalTo(self.view.mas_left).mas_offset(10);
      make.right.mas_equalTo(self.displayView.mas_left).mas_offset(-10);
      make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.mas_equalTo(self.displayView.mas_centerY);
      make.left.mas_equalTo(self.displayView.mas_right).mas_offset(10);
      make.right.mas_equalTo(self.view.mas_right).mas_offset(-10);
      make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.indexLable.mas_bottom).mas_offset(10);
      make.height.mas_equalTo(kScreen_Width - 80 * 2);
    }];

    [self.view addSubview:self.descLable];
    [self.descLable mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.displayView.mas_bottom).offset(10);
      make.centerX.mas_equalTo(self.view.mas_centerX);
      make.height.mas_equalTo(40);
    }];
    
    UIButton *playBtn = [[UIButton alloc] init];
    [playBtn setTitle:@"Play" forState:UIControlStateNormal];
    playBtn.backgroundColor = [UIColor grayColor];
    [playBtn setTag:kPlay];
    
    [playBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:playBtn];
    [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descLable.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.descLable.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    [self.view addSubview:self.animationView];
    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(playBtn.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(playBtn.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

- (void)loadViewData {
    [self.indexLable setText:[self.viewModel getIndexString]];
    [self.descLable setText:[self.viewModel getDescString]];
    [self.displayView setImage:[self.viewModel getCurrentImage]];
}

- (void)click:(UIButton *)button {
    switch (button.tag) {
        case kPrevious:
            [self.viewModel previous];
            [self loadViewData];
            break;
        case kNext:
            [self.viewModel next];
            [self loadViewData];
            break;
        case kPlay:
            [self.animationView setAnimationImages:self.viewModel.animationImageArray];
            [self.animationView setAnimationRepeatCount:1];
            [self.animationView setAnimationDuration:4];
            [self.animationView startAnimating];
            break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
