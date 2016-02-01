//
//  DrawView.m
//  exer
//
//  Created by 肖君 on 16/2/1.
//  Copyright © 2016年 ORA. All rights reserved.
//

#import "Demo5DrawView.h"

@implementation Demo5DrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
#pragma mark - add line one
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 300, 100);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    CGContextSetLineWidth(ctx, 15);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextStrokePath(ctx);

#pragma mark - add line two
    CGContextMoveToPoint(ctx, 50, 200);
    CGContextAddLineToPoint(ctx, 300, 60);
    [[UIColor grayColor] set];
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextStrokePath(ctx);

#pragma mark - add triangle
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 40, 300);
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextClosePath(ctx);
    [[UIColor redColor] set];
    CGContextStrokePath(ctx);
    
#pragma mark - add rect
    CGContextAddRect(ctx, CGRectMake(20, 400, 100, 100));
    CGContextFillPath(ctx);
    
#pragma mark - add Arc
    CGContextAddArc(ctx, 200, 300, 80, 0, 2*M_PI, 0);
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokePath(ctx);
}

@end
