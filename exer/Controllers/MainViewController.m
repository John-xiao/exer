//
//  MainViewController.m
//  exer
//
//  Created by 肖君 on 16/1/26.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo1ButtonViewController.h"
#import "Demo2ImageBrowserViewController.h"
#import "Demo3ScrollviewZoomViewController.h"
#import "Demo4TableViewWithSectionIndexViewController.h"
#import "Demo5Quartz2DViewController.h"
#import "Demo6CalayerSimpleTestViewController.h"
#import "Demo7BaseAnimationViewController.h"
#import "MainViewCell.h"
#import "MainViewController.h"

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController
- (MainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MainViewModel alloc] init];
    }
    return _viewModel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        // Init TableView
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[MainViewCell class] forCellReuseIdentifier:CELL_ID_MAINVIEW];
    }

    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self.viewModel loadData];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self hideNavigationBar];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.right.bottom.left.mas_equalTo(self.view);
    }];
}

#pragma mark TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.demos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_MAINVIEW forIndexPath:indexPath];
    [self configureCell:(MainViewCell *)cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(MainViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    MainMenuModel *data = self.viewModel.demos[indexPath.row];
    [cell.name setText:data.name];
    [cell.icon setImage:[UIImage imageNamed:data.image]];
}

#pragma mark TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    MainMenuModel *data = self.viewModel.demos[indexPath.row];
    switch (indexPath.row) {
        case 0: {
            Demo1ButtonViewController *VC = [[Demo1ButtonViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case 1: {
            Demo2ImageBrowserViewController *VC = [[Demo2ImageBrowserViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case 2: {
            Demo3ScrollviewZoomViewController *VC = [[Demo3ScrollviewZoomViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case 3: {
            Demo4TableViewWithSectionIndexViewController *VC =
                [[Demo4TableViewWithSectionIndexViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case 4: {
            Demo5Quartz2DViewController *VC =
            [[Demo5Quartz2DViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case 5: {
            Demo6CalayerSimpleTestViewController *VC =
            [[Demo6CalayerSimpleTestViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        case 6: {
            Demo7BaseAnimationViewController *VC =
            [[Demo7BaseAnimationViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        } break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath {
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
