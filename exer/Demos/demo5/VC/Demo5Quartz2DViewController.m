//
//  Demo5Quartz2DViewController.m
//  exer
//
//  Created by 肖君 on 16/2/1.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo5DrawView.h"
#import "Demo5Quartz2DViewController.h"

@interface Demo5Quartz2DViewController ()
@property(nonatomic, strong) Demo5DrawView *drawView;
@end

@implementation Demo5Quartz2DViewController
- (Demo5DrawView *)drawView {
    if (!_drawView) {
        _drawView = [[Demo5DrawView alloc] init];
        _drawView.backgroundColor = [UIColor orangeColor];
        
    }
    return _drawView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    [self.view addSubview:self.drawView];
    [self.drawView mas_makeConstraints : ^(MASConstraintMaker *make) {
      make.top.right.bottom.left.mas_equalTo(self.view);
    }];
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
