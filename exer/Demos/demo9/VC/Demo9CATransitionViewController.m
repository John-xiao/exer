//
//  Demo9CATransitionViewController.m
//  exer
//
//  Created by 肖君 on 16/2/3.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo9CATransitionViewController.h"

@interface Demo9CATransitionViewController ()
@property(nonatomic, strong) UIButton *preBtn;
@property(nonatomic, strong) UIButton *nextBtn;
@property(nonatomic, strong) UIImageView *displayView;
@property(nonatomic, assign) NSInteger index;
@end

@implementation Demo9CATransitionViewController

typedef enum { kPrevious = 0, kNext } butTag;

- (UIButton *)preBtn {
    if (!_preBtn) {
        _preBtn = [[UIButton alloc] init];
        [_preBtn setTitle:@"上一张" forState:UIControlStateNormal];
        _preBtn.backgroundColor = [UIColor brownColor];
        _preBtn.tag = kPrevious;
    }
    return _preBtn;
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc] init];
        [_nextBtn setTitle:@"下一张" forState:UIControlStateNormal];
        _nextBtn.backgroundColor = [UIColor brownColor];
        _nextBtn.tag = kNext;
    }
    return _nextBtn;
}

- (UIImageView *)displayView {
    if (!_displayView) {
        _displayView = [[UIImageView alloc] init];
        _displayView.backgroundColor = [UIColor orangeColor];
        NSString *image = [NSString stringWithFormat:@"0%ld", self.index];
        [self.displayView setImage:[UIImage imageNamed:image]];
    }
    return _displayView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 0;
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    [self.view addSubview:self.preBtn];
    [self.view addSubview:self.nextBtn];
    [self.view addSubview:self.displayView];

    [self.preBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    [self.preBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.mas_equalTo(self.displayView.mas_centerY);
      make.left.mas_equalTo(self.view.mas_left).mas_offset(10);
      make.right.mas_equalTo(self.displayView.mas_left).mas_offset(-10);
      make.size.mas_equalTo(CGSizeMake(60, 40));
    }];

    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerY.mas_equalTo(self.displayView.mas_centerY);
      make.left.mas_equalTo(self.displayView.mas_right).mas_offset(10);
      make.right.mas_equalTo(self.view.mas_right).mas_offset(-10);
      make.size.mas_equalTo(CGSizeMake(60, 40));
    }];

    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.view.mas_top).mas_offset(80);
      make.height.mas_equalTo(kScreen_Width - 2 * 80);
    }];
}

- (void)btnClick:(UIButton *)button {
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";
    anima.duration = 1.0;
    switch (button.tag) {
        case kPrevious:
            if (self.index > 0) {
                self.index--;
                anima.subtype = kCATransitionFromLeft;
            } else {
                return;
            }
            break;
        case kNext:
            if (self.index < 9) {
                self.index++;
                anima.subtype = kCATransitionFromRight;
            } else {
                return;
            }
            break;
        default:
            return;
    }
    NSString *image = [NSString stringWithFormat:@"0%ld", self.index];
    [self.displayView setImage:[UIImage imageNamed:image]];
    [self.displayView.layer addAnimation:anima forKey:nil];
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
