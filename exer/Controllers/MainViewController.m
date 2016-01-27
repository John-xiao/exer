//
//  MainViewController.m
//  exer
//
//  Created by 肖君 on 16/1/26.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MainViewController
-(MainViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MainViewModel alloc] init];
    }
    return _viewModel;
}

-(UITableView *)tableView{
    if (!_tableView) {
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideNavigationBar];
    
    [self.viewModel loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupViews{
    
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
