//
//  Demo1ButtonViewController.m
//  exer
//
//  Created by 肖君 on 16/1/28.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo1ButtonViewController.h"

@interface Demo1ButtonViewController ()
@property(nonatomic, strong) UIImageView *moveView;
@end

@implementation Demo1ButtonViewController

typedef enum { kup = 1, kdown, kright, kleft, kzoomin, kzoomout } btntag;

- (UIImageView *)moveView {
    if (!_moveView) {
        _moveView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 150, 40, 40)];
        _moveView.backgroundColor = [UIColor blueColor];
    }
    return _moveView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showNavigationBar];
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    UIButton *btnup = [[UIButton alloc] init];
    [btnup setTitle:@"UP" forState:UIControlStateNormal];
    [btnup setTag:kup];
    btnup.backgroundColor = [UIColor grayColor];
    UIButton *btndown = [[UIButton alloc] init];
    [btndown setTitle:@"DOWN" forState:UIControlStateNormal];
    [btndown setTag:kdown];
    btndown.backgroundColor = [UIColor grayColor];
    UIButton *btnleft = [[UIButton alloc] init];
    [btnleft setTitle:@"LEFT" forState:UIControlStateNormal];
    [btnleft setTag:kleft];
    btnleft.backgroundColor = [UIColor grayColor];
    UIButton *btnright = [[UIButton alloc] init];
    [btnright setTitle:@"RIGHT" forState:UIControlStateNormal];
    [btnright setTag:kright];
    btnright.backgroundColor = [UIColor grayColor];

    [btnup addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btndown addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btnleft addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btnright addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btnup];
    [self.view addSubview:btndown];
    [self.view addSubview:btnleft];
    [self.view addSubview:btnright];

    [btnup mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.view.mas_top).with.mas_offset(10);
      make.left.mas_equalTo(self.view.mas_left).mas_offset(10);
      make.right.mas_equalTo(btndown.mas_left).mas_offset(-10);
      make.height.mas_equalTo(40);
      make.width.mas_equalTo(btndown);
    }];

    [btndown mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.view.mas_top).with.mas_offset(10);
      make.left.mas_equalTo(btnup.mas_right).mas_offset(10);
      make.right.mas_equalTo(btnleft.mas_left).mas_offset(-10);
      make.height.mas_equalTo(40);
      make.width.mas_equalTo(btnup);
    }];

    [btnleft mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.view.mas_top).with.mas_offset(10);
      make.left.mas_equalTo(btndown.mas_right).mas_offset(10);
      make.right.mas_equalTo(btnright.mas_left).mas_offset(-10);
      make.height.mas_equalTo(40);
      make.width.mas_equalTo(btnup);
    }];

    [btnright mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(self.view.mas_top).with.mas_offset(10);
      make.left.mas_equalTo(btnleft.mas_right).mas_offset(10);
      make.right.mas_equalTo(self.view.mas_right).mas_offset(-10);
      make.height.mas_equalTo(40);
      make.width.mas_equalTo(btnup);
    }];

    UIButton *btnzoomin = [[UIButton alloc] init];
    [btnzoomin setTitle:@"ZOOM IN" forState:UIControlStateNormal];
    [btnzoomin setTag:kzoomin];
    btnzoomin.backgroundColor = [UIColor grayColor];
    UIButton *btnzoomout = [[UIButton alloc] init];
    [btnzoomout setTitle:@"ZOOM OUT" forState:UIControlStateNormal];
    [btnzoomout setTag:kzoomout];
    btnzoomout.backgroundColor = [UIColor grayColor];

    [btnzoomin addTarget:self action:@selector(zoom:) forControlEvents:UIControlEventTouchUpInside];
    [btnzoomout addTarget:self action:@selector(zoom:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btnzoomin];
    [self.view addSubview:btnzoomout];

    [btnzoomin mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(btnup.mas_bottom).mas_offset(10);
      make.left.mas_equalTo(self.view.mas_left).mas_offset(10);
      make.right.mas_equalTo(btnzoomout.mas_left).mas_offset(-10);
      make.height.mas_equalTo(40);
      make.width.mas_equalTo(btnzoomout);
    }];

    [btnzoomout mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(btnup.mas_bottom).mas_offset(10);
      make.left.mas_equalTo(btnzoomin.mas_right).mas_offset(10);
      make.right.mas_equalTo(self.view.mas_right).mas_offset(-10);
      make.height.mas_equalTo(40);
      make.width.mas_equalTo(btnzoomout);
    }];

    [self.view addSubview:self.moveView];
}

- (void)click:(UIButton *)button {
    //    CGPoint center = self.moveView.center;
    CGAffineTransform transform;
    switch (button.tag) {
        case kup:
            //            center.y -= 10;
            transform = CGAffineTransformTranslate(self.moveView.transform, 0.0, -20.0);
            break;
        case kdown:
            //            center.y += 10;
            transform = CGAffineTransformTranslate(self.moveView.transform, 0.0, 20.0);
            break;
        case kright:
            //            center.x -= 10;
            transform = CGAffineTransformTranslate(self.moveView.transform, -20.0, 0.0);
            break;
        case kleft:
            //            center.x += 10;
            transform = CGAffineTransformTranslate(self.moveView.transform, 20.0, 0.0);
            break;

        default:
            break;
    }

    //    [UIView beginAnimations:nil context:nil];
    //    self.moveView.center = center;
    //    [UIView setAnimationDuration:2.0];
    //    [UIView commitAnimations];
    [UIView animateWithDuration:0.5
                     animations:^{
                       self.moveView.transform = transform;
                     }];
}

- (void)zoom:(UIButton *)button {
    CGAffineTransform transform;
    switch (button.tag) {
        case kzoomin:

            transform = CGAffineTransformScale(self.moveView.transform, 0.8, 0.8);
            break;
        case kzoomout:
            transform = CGAffineTransformScale(self.moveView.transform, 1.2, 1.2);
            break;
        default:
            break;
    }

    [UIView animateWithDuration:0.5
                     animations:^{
                       self.moveView.transform = transform;
                     }];
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
