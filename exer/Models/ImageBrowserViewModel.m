//
//  ImageBrowserViewModel.m
//  exer
//
//  Created by 肖君 on 16/1/28.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "ImageBrowserViewModel.h"
#import "ImageBrowserModel.h"
@implementation ImageBrowserViewModel
-(NSMutableArray *) imageArray
{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}

-(void) loadData
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"DataSource" ofType:@"plist"];
    NSDictionary * data = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray * demoArray = [data getObjectByPath:@"Demo2ImageBorwser/data"];
    [self.imageArray setArray:[ImageBrowserModel mj_objectArrayWithKeyValuesArray:demoArray]];
}
@end
