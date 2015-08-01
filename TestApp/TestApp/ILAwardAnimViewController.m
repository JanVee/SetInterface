//
//  ILSettingViewController.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILAwardAnimViewController.h"
#import "ILKeys.h"
@interface ILAwardAnimViewController ()

@end

@implementation ILAwardAnimViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"中奖动画";
    
    ILSettingSwitchItem *anim = [ILSettingSwitchItem itemWithTitle:self.title];
    anim.key = ILSettingAwardAnim;
    ILSettingGroup *group = [[ILSettingGroup alloc] init];
    group.header = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
    group.items = @[anim];
    [_allGroups addObject:group];
}

@end
