//
//  ImageBrowserViewModel.m
//  exer
//
//  Created by 肖君 on 16/1/28.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "ImageBrowserModel.h"
#import "ImageBrowserViewModel.h"
@interface ImageBrowserViewModel ()
@property(nonatomic, assign) NSInteger currentIndex;
@end

@implementation ImageBrowserViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentIndex = 0;
    }
    return self;
}

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}

- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DataSource" ofType:@"plist"];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *demoArray = [data getObjectByPath:@"Demo2ImageBorwser/data"];
    [self.imageArray setArray:[ImageBrowserModel mj_objectArrayWithKeyValuesArray:demoArray]];
}

- (void)previous{
    if (self.currentIndex > 0) {
        self.currentIndex--;
    }
}

- (void)next{
    if (self.currentIndex < (self.imageArray.count - 1)) {
        self.currentIndex++;
    }
}

- (NSString *)getIndexString {
    return [NSString stringWithFormat:@"%ld/%lu", (long)(self.currentIndex + 1), self.imageArray.count];
}

-(NSString *)getDescString{
    return ((ImageBrowserModel *)self.imageArray[self.currentIndex]).name;
}

-(UIImage *)getCurrentImage{
    NSString * imageName = ((ImageBrowserModel *)self.imageArray[self.currentIndex]).image;
    return [UIImage imageNamed:imageName];
}
@end
