//
//  ILSettingViewController.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILPushNoticeViewController.h"
#import "ILAwardPushViewController.h"
#import "ILAwardAnimViewController.h"
#import "ILScoreShowNoticeViewController.h"
#import "ILBuyTimedNoticeViewController.h"

@interface ILPushNoticeViewController ()

@end

@implementation ILPushNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"推送和提醒";
    
    // 1.1 开奖号码推送
    ILSettingArrowItem *push = [ILSettingArrowItem itemWithTitle:@"开奖号码推送"];
    push.showVCClass = [ILAwardPushViewController class];
    
    // 1.2 中奖动画
    ILSettingArrowItem *anim = [ILSettingArrowItem itemWithTitle:@"中奖动画"];
    anim.showVCClass = [ILAwardAnimViewController class];
    
    // 1.3 比分直播提醒
    ILSettingArrowItem *score = [ILSettingArrowItem itemWithTitle:@"比分直播提醒"];
    score.showVCClass = [ILScoreShowNoticeViewController class];
    
    // 1.4 购彩定时提醒
    ILSettingArrowItem *time = [ILSettingArrowItem itemWithTitle:@"购彩定时提醒"];
    time.showVCClass = [ILBuyTimedNoticeViewController class];
    
    ILSettingGroup *group = [[ILSettingGroup alloc] init];
    group.items = @[push, anim, score, time];
    [_allGroups addObject:group];
}

@end
