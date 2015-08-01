//
//  ILSettingViewController.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILAwardPushViewController.h"
#import "ILKeys.h"

@interface ILAwardPushViewController ()

@end

@implementation ILAwardPushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"开奖推送设置";
    
    // 1.1.双色球
    ILSettingSwitchItem *ball = [ILSettingSwitchItem itemWithTitle:@"双色球"];
    ball.key = ILSettingAwardPushSSQ;
    
    // 1.2.大乐透
    ILSettingSwitchItem *letou = [ILSettingSwitchItem itemWithTitle:@"大乐透"];
    letou.key = ILSettingAwardPushDLT;
    
    ILSettingGroup *group = [[ILSettingGroup alloc] init];
    group.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    group.items = @[ball, letou];
    [_allGroups addObject:group];
}
@end