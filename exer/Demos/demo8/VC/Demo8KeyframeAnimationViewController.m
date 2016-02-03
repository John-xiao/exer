//
//  Demo8KeyframeAnimationViewController.m
//  exer
//
//  Created by 肖君 on 16/2/2.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo8KeyframeAnimationViewController.h"

@interface Demo8KeyframeAnimationViewController ()
@property(nonatomic, strong) CALayer *layer;
@end

@implementation Demo8KeyframeAnimationViewController
- (CALayer *)layer {
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

- (void)setupView {
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view.layer addSublayer:self.layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animation];
    // Postions
//    anima.keyPath = @"position";
    //设置values
//    int x = 0;
//    int y = 0;
//    NSMutableArray *valueList = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 10; i++) {
//        NSValue *value = [NSValue valueWithCGPoint:CGPointMake(x + i * 10, y + i * 20)];
//        [valueList addObject:value];
//    }
//    anima.values = valueList;
    
    //设置path
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
//    anima.path = path;
//    CGPathRelease(path);

//    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anima.removedOnCompletion = NO;
//    anima.fillMode = kCAFillModeForwards;
//    anima.duration = 2.0;

    //rotation
    anima.keyPath = @"transform.rotation";
    anima.duration = 0.1;
    anima.values = @[@(-(4)/180.0*M_PI), @((4)/180.0*M_PI), @(-(4)/180.0*M_PI)];
    anima.repeatCount = MAXFLOAT;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    
    anima.delegate = self;
    [self.layer addAnimation:anima forKey:@"animation"];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //删除动画
//    [self.layer removeAnimationForKey:@"animation"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"Animation started");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
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
