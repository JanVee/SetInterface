//
//  ILSettingCell.h
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ILSettingItem;
@interface ILSettingCell : UITableViewCell
@property (nonatomic, strong) ILSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;
+ (instancetype)settingCellWithTableView:(UITableView *)tableView;
@end
