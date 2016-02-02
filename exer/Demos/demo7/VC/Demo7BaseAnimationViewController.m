//
//  Demo7CoreAnimationPrimaryViewController.m
//  exer
//
//  Created by 肖君 on 16/2/2.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo7BaseAnimationViewController.h"

@interface Demo7BaseAnimationViewController ()
@property (nonatomic,strong) CALayer *layer;
@end

@implementation Demo7BaseAnimationViewController
-(CALayer *)layer{
    if (!_layer) {
        _layer = [CALayer layer];
        _layer.backgroundColor = [UIColor yellowColor].CGColor;
        _layer.cornerRadius = 20;
        _layer.anchorPoint = CGPointZero;
        _layer.position = CGPointMake(150, 200);
        _layer.bounds = CGRectMake(0, 0, 100, 100);
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

-(void)setupView{
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view.layer addSublayer:self.layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *anima = [CABasicAnimation animation];
    //Postions
//    anima.keyPath = @"position";
//    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    //transform
    anima.keyPath = @"transform";
//    anima.toValue = [NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(M_PI_4)];
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2 + M_PI_4, 1, 1, 0)];
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    anima.duration = 2.0;
    anima.delegate = self;
    [self.layer addAnimation:anima forKey:nil];
}

-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"Animation started");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"Animation stopped");
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
