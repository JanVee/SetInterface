//
//  ILCircleBgView.m
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//


#import "ILCircleBgView.h"

@implementation ILCircleBgView
+ (instancetype)circleBgView
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark setFrame:和setBounds:能保证尺寸永远是286x286
- (void)setFrame:(CGRect)frame
{
    frame.size = CGSizeMake(ILCircleWH, ILCircleWH);
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds
{
    bounds.size = CGSizeMake(ILCircleWH, ILCircleWH);
    [super setBounds:bounds];
}

- (void)drawRect:(CGRect)rect {
    // 画最底层的背景图
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // copy一个ctx对象到栈中
    CGContextSaveGState(ctx);
    // 绘图裁剪
    // 画圆,设置尺寸
    //CGFloat innerCircleXY = 9;
    //CGFloat innerCircleWH = ILCircleWH - innerCircleXY*2;
    //CGRect innerCircleRect = CGRectMake(innerCircleXY, innerCircleXY, innerCircleWH, innerCircleWH);
    // 剪裁  （CGContextClip会把之前所画的剪下来）
    CGContextClip(ctx);
    [[UIImage imageNamed:@"LuckyBaseBackground"] drawInRect:rect];
    CGContextRestoreGState(ctx);
    // 画中间的转盘图
    [[UIImage imageNamed:@"LuckyRotateWheel"] drawInRect:rect];
}

@end
