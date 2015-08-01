//
//  ILSettingViewController.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#import "ILBuyTimedNoticeViewController.h"
#import "ILKeys.h"

@interface ILBuyTimedNoticeViewController ()

@end

@implementation ILBuyTimedNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"提醒设置";
    
    ILSettingSwitchItem *notice = [ILSettingSwitchItem itemWithTitle:@"打开提醒"];
    notice.key = ILSettingBuyTimedNotice;
    
    ILSettingGroup *group = [[ILSettingGroup alloc] init];
    group.items = @[notice];
    group.header = @"您可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [_allGroups addObject:group];
}

@end
