//
//  Demo10FMDBViewController.m
//  exer
//
//  Created by 肖君 on 16/2/24.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo10FMDBViewController.h"

@interface Demo10FMDBViewController ()
@property(nonatomic, strong) UIButton *deleteBtn;
@property(nonatomic, strong) UIButton *insertBtn;
@property(nonatomic, strong) UIButton *queryBtn;
@property(nonatomic, strong) FMDatabase *db;
@end

@implementation Demo10FMDBViewController
typedef enum { kDelete = 0, kInsert, kQuery } butTag;

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] init];
        [_deleteBtn setTitle:@"Delete" forState:UIControlStateNormal];
        _deleteBtn.backgroundColor = [UIColor brownColor];
        _deleteBtn.tag = kDelete;
    }
    return _deleteBtn;
}

- (UIButton *)insertBtn {
    if (!_insertBtn) {
        _insertBtn = [[UIButton alloc] init];
        [_insertBtn setTitle:@"Insert" forState:UIControlStateNormal];
        _insertBtn.backgroundColor = [UIColor brownColor];
        _insertBtn.tag = kInsert;
    }
    return _insertBtn;
}

- (UIButton *)queryBtn {
    if (!_queryBtn) {
        _queryBtn = [[UIButton alloc] init];
        [_queryBtn setTitle:@"Query" forState:UIControlStateNormal];
        _queryBtn.backgroundColor = [UIColor brownColor];
        _queryBtn.tag = kQuery;
    }
    return _queryBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDB];
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    [self.view addSubview:self.deleteBtn];
    [self.view addSubview:self.insertBtn];
    [self.view addSubview:self.queryBtn];

    [self.deleteBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.insertBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.queryBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.mas_equalTo(self.view.mas_centerX);
      make.top.mas_equalTo(self.view.mas_top).mas_offset(10);
      make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
    [self.insertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.mas_equalTo(self.view.mas_centerX);
      make.top.mas_equalTo(self.deleteBtn.mas_bottom).mas_offset(10);
      make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
    [self.queryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.mas_equalTo(self.view.mas_centerX);
      make.top.mas_equalTo(self.insertBtn.mas_bottom).mas_offset(10);
      make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
}

- (void)initDB {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *DBName = [doc stringByAppendingPathComponent:@"student.sqlite"];

    FMDatabase *db = [FMDatabase databaseWithPath:DBName];

    if ([db open]) {
        NSString *create = @"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT "
                           @"NULL, age integer NOT NULL);";
        BOOL result = [db executeUpdate:create];
        if (result) {
            NSLog(@"Create Table Success");
        }
    }
    self.db = db;
}

- (void)click:(UIButton *)button {
    switch (button.tag) {
        case kDelete:
            [self delete];
            break;
        case kInsert:
            [self insert];
            break;
        case kQuery:
            [self query];
            break;
        default:
            break;
    }
}

- (void) delete {
    NSString *drop = @"DROP TABLE IF EXISTS t_student;";
    NSString *create = @"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT "
                       @"NULL, age integer NOT NULL);";
    [self.db executeUpdate:drop];
    [self.db executeUpdate:create];
}

- (void)insert {
    for (int i = 0; i < 10 ; i++) {
        NSString *name = [NSString stringWithFormat:@"John-%d", arc4random_uniform(100)];
        [self.db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES (%@, %d);", name, arc4random_uniform(30)];
    }
}

-(void)query {
    FMResultSet *result = [self.db executeQuery:@"SELECT * FROM t_student;"];
    
    while ([result next]) {
        int ID = [result intForColumn:@"id"];
        NSString *name = [result stringForColumn:@"name"];
        int age = [result intForColumn:@"age"];
        NSLog(@"%d, %@, %d", ID, name, age);
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
