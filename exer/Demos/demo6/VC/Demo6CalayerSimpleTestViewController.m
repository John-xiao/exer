//
//  Demo5CalyerSimpleTestViewController.m
//  exer
//
//  Created by 肖君 on 16/2/2.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo6CalayerSimpleTestViewController.h"

@interface Demo6CalayerSimpleTestViewController ()
@property(nonatomic, strong) UIView *displayView;
@property (nonatomic,strong) UIImageView *displayImage;
@property (nonatomic,strong) CALayer *layer;
@end

@implementation Demo6CalayerSimpleTestViewController
- (UIView *)displayView {
    if (!_displayView) {
        _displayView = [[UIView alloc] init];
        _displayView.backgroundColor = [UIColor redColor];
    }
    return _displayView;
}

-(UIImageView *)displayImage{
    if (!_displayImage) {
        _displayImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"00"]];
        _displayImage.backgroundColor = [UIColor redColor];
    }
    return _displayImage;
}

-(CALayer *)layer{
    if (!_layer) {
        _layer = [CALayer layer];
    }
    return _layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.displayView];
    [self.view addSubview:self.displayImage];
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.center.mas_equalTo(self.view);
      make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    [self.displayImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.displayView.mas_centerX);
        make.top.mas_equalTo(self.displayView.mas_bottom).mas_offset(10);
    }];
    
    self.displayView.layer.borderWidth = 20;
    self.displayView.layer.borderColor = [UIColor greenColor].CGColor;
    self.displayView.layer.cornerRadius = 20;
//    mask to bound confilict with shadow
//    self.displayView.layer.masksToBounds = YES;
//    self.displayView.layer.contents = (id)[UIImage imageNamed:@"background001"].CGImage;
    self.displayView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.displayView.layer.shadowOffset = CGSizeMake(10, 10);
    self.displayView.layer.shadowOpacity = 0.6;
    
    self.displayImage.layer.borderWidth = 2;
    self.displayImage.layer.borderColor = [UIColor greenColor].CGColor;
    self.displayImage.layer.cornerRadius = 2;
    self.displayImage.layer.masksToBounds = YES;
//    self.displayImage.layer.transform = CATransform3DMakeTranslation(100, 20, 20);
    self.displayImage.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    
    
//position layer出现在父layer中的坐标
//anchor layer自身那个点在position上，取值范围是0~1
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.position = CGPointMake(100, 100);
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.view.layer addSublayer:self.layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.layer.bounds = CGRectMake(0, 0, 200, 200);;
    self.layer.backgroundColor = [UIColor brownColor].CGColor;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches move");
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches cancel");
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
