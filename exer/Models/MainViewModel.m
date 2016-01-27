//
//  MainViewModel.m
//  exer
//
//  Created by 肖君 on 16/1/27.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "MainViewModel.h"

@implementation MainViewModel

-(NSMutableArray *) demos{
    if (!_demos) {
        _demos = [[NSMutableArray alloc] init];
    }
    return _demos;
}

- (void)loadData{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"DataSource" ofType:@"plist"];
    NSDictionary * data = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray * demoArray = [data getObjectByPath:@"mainview/data"];
    [self.demos setArray:[MainMenuModel mj_objectArrayWithKeyValuesArray:demoArray]];
}
@end
