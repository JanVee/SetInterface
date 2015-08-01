//
//  ILTabBar.m
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILTabBar.h"
#import "ILTabBarButton.h"

@interface ILTabBar ()
{
    ILTabBarButton *_selectedButton;
}

@end

@implementation ILTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.backgroundColor = [UIColor clearColor];//[UIColor colorWithPatternImage:[UIImage imageNamed:@"TabBarBack"]];
    }
    return self;
}

#pragma mark 添加一个按钮
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon
{
    // 1.创建按钮
    ILTabBarButton *button = [ILTabBarButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置背景
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selIcon] forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 3.添加
    [self addSubview:button];
    
    // 4.重新调整所有按钮的frame
    [self adjustButtonFrames];
    
    // 5.默认选中第0个按钮
    button.tag = self.subviews.count - 1;
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

#pragma mark 重新调整所有按钮的frame
- (void)adjustButtonFrames
{
    int btnCount = self.subviews.count;
    for (int i = 0; i < btnCount; i++) {
        ILTabBarButton *button = self.subviews[i];
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / btnCount;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonH = self.frame.size.height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

#pragma mark 监听按钮点击
- (void)buttonClick:(ILTabBarButton *)button
{
    // 1.通知代理
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [_delegate tabBar:self didSelectButtonFrom:_selectedButton.tag to:button.tag];
    }
    
    // 2.切换按钮状态
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
}

@end
