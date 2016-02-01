//
//  Demo4ViewModel.m
//  exer
//
//  Created by 肖君 on 16/2/1.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo4ViewModel.h"
@interface Demo4ViewModel()
@end

@implementation Demo4ViewModel
-(NSMutableArray *)dataGroupList{
    if (!_dataGroupList) {
        _dataGroupList = [[NSMutableArray alloc] init];
    }
    return _dataGroupList;
}

-(NSMutableArray *) titleList{
    if (!_titleList) {
        _titleList = [[NSMutableArray alloc] init];
    }
    return _titleList;
}

-(void)LoadData{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"DataSource" ofType:@"plist"];
    NSDictionary * rootData = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray * dataArray = [rootData getObjectByPath:@"Demo4TableViewWithSectionIndex"];
    for (NSDictionary * dic in dataArray) {
        [self.titleList addObject:[dic getObjectByPath:@"title"]];
        NSArray * groupData = [Demo4Data mj_objectArrayWithKeyValuesArray:[dic getObjectByPath:@"datas"]];
        [self.dataGroupList addObject:groupData];
    }
}
@end
