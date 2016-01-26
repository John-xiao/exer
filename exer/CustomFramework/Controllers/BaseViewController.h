//
//  BaseViewController.h
//  exer
//
//  Created by 肖君 on 16/1/26.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//显示/隐藏导航
- (void)hideNavigationBar;
- (void)showNavigationBar;

//显示/隐藏状态栏
- (void)showStatusBar;
- (void)hideStatusBar;


@end
