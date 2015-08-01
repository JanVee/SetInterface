//
//  ILSettingViewController.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILCircleView.h"
#import "ILCircleBgView.h"

@implementation ILCircleView
#pragma mark - 生命周期方法
+ (instancetype)circleView
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
        // 1.添加背景
        [self setupBg];
        
        // 2.添加开始按钮
        [self setupStartBtn];
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

#pragma mark - 私有方法
#pragma mark 添加背景
- (void)setupBg
{
    ILCircleBgView *bgView = [ILCircleBgView circleBgView];
    [self addSubview:bgView];
}

#pragma mark 添加开始按钮
- (void)setupStartBtn
{
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.bounds = CGRectMake(0, 0, 81, 81);
    startBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    [startBtn setBackgroundImage:[UIImage imageNamed:@"LuckyCenterButton"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"LuckyCenterButtonPressed"] forState:UIControlStateHighlighted];
    [self addSubview:startBtn];
}

@end
