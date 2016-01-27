//
//  MainViewModel.h
//  exer
//
//  Created by 肖君 on 16/1/27.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "MainMenuModel.h"
#import <Foundation/Foundation.h>
@interface MainViewModel : NSObject

@property(nonatomic, strong) NSMutableArray *demos;

- (void)loadData;
@end
