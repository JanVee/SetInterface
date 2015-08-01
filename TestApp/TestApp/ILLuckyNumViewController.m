//
//  ILLuckyNumViewController.m
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILLuckyNumViewController.h"
#import "ILCircleView.h"
#import "ILThreeButton.h"

#define is4inch ([UIScreen mainScreen].bounds.size.height == 568.0f)

@interface ILLuckyNumViewController ()
{
    ILThreeButton *_threeButton;
}
@end

@implementation ILLuckyNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    // 1.添加一个全屏的背景
    [self setupBg];
    
    // 2.添加3个选择按钮
    [self setupThreeBtn];

    // 2.添加转盘
    [self setupCircle];
}

#pragma mark 添加转盘
- (void)setupCircle
{
    ILCircleView *circle = [ILCircleView circleView];
    CGFloat cx = _threeButton.center.x;
    CGFloat cy = CGRectGetMaxY(_threeButton.frame) + circle.frame.size.height * 0.5;
    
    if (!is4inch) { // 3.5inch屏幕，往上移动10个点
        cy -= 20;
    }
    
    circle.center = CGPointMake(cx, cy);
    [self.view addSubview:circle];
}

#pragma mark 添加3个选择按钮
- (void)setupThreeBtn
{
    ILThreeButton *tb = [ILThreeButton threeButton];
    CGFloat cx = self.view.frame.size.width * 0.5;
    CGFloat cy = tb.frame.size.height * 0.5 + 20;
    tb.center = CGPointMake(cx, cy);
    [self.view addSubview:tb];
    _threeButton = tb;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 添加一个全屏的背景
- (void)setupBg
{
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:is4inch?@"LuckyBackground-568h@2x.jpg":@"LuckyBackground@2x.jpg"];
    bg.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:bg];
}

@end
