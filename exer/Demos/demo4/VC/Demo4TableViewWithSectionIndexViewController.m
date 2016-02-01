//
//  Demo4TableViewWithSectionIndexViewController.m
//  exer
//
//  Created by 肖君 on 16/2/1.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo4Cell.h"
#import "Demo4TableViewWithSectionIndexViewController.h"

@interface Demo4TableViewWithSectionIndexViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation Demo4TableViewWithSectionIndexViewController

- (Demo4ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[Demo4ViewModel alloc] init];
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
        [_tableView registerClass:[Demo4Cell class] forCellReuseIdentifier:CELL_ID_DEMO4];
    }

    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.viewModel LoadData];
    [self setupView];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

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

#pragma mark TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataGroupList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)(self.viewModel.dataGroupList[section])).count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.viewModel.titleList[section];
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.viewModel.titleList;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID_DEMO4 forIndexPath:indexPath];
    [self configureCell:(Demo4Cell *)cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(Demo4Cell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Demo4Data *data = ((NSArray *)self.viewModel.dataGroupList[indexPath.section])[indexPath.row];
    [cell.name setText:data.name];
    [cell.icon setImage:[UIImage imageNamed:data.icon]];
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
