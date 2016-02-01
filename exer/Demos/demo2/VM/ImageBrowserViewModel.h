//
//  ImageBrowserViewModel.h
//  exer
//
//  Created by 肖君 on 16/1/28.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageBrowserViewModel : NSObject
@property(nonatomic, strong) NSMutableArray *imageArray;
@property(nonatomic, strong) NSMutableArray *animationImageArray;

- (void)loadData;
- (void)previous;
- (void)next;
- (NSString *)getIndexString;
- (NSString *)getDescString;
- (UIImage *)getCurrentImage;
@end
