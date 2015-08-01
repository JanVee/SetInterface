//
//  ILBaseSettingViewController.h
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILSettingGroup.h"
#import "ILSettingItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingLabelItem.h"

@interface ILBaseSettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_allGroups; //所有的组模型
}

@property (nonatomic, strong) UITableView *tableView;

@end
