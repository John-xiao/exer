//
//  Demo4ViewModel.h
//  exer
//
//  Created by 肖君 on 16/2/1.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Demo4Data.h"

@interface Demo4ViewModel : NSObject
@property(nonatomic, strong) NSMutableArray *dataGroupList;
@property(nonatomic, strong) NSMutableArray *titleList;

-(void) LoadData;
@end
