//
//  ILBaseSettingViewController.m
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILBaseSettingViewController.h"
#import "ILSettingCell.h"

const int ILCellSectionHeaderH = 20;
#define ILGlobalBg [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]]
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define is4inch ([UIScreen mainScreen].bounds.size.height == 480.0f)
@interface ILBaseSettingViewController ()

@end

@implementation ILBaseSettingViewController

- (void)loadView {
    [super viewDidLoad];
    self.title = @"设置界面";
    
    _allGroups = [NSMutableArray array];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 设置背景
    tableView.backgroundView = nil;
    tableView.backgroundColor = ILGlobalBg;
    
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = ILCellSectionHeaderH;
    
    if (iOS7) {
        tableView.contentInset = UIEdgeInsetsMake(ILCellSectionHeaderH-35, 0, 0, 0);
    }
    if (is4inch) {
        tableView.contentInset = UIEdgeInsetsMake(ILCellSectionHeaderH-35, 0, 35, 0);
    }
    tableView.separatorStyle = 0;
    self.view = tableView;
    _tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_allGroups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ILSettingGroup *group = _allGroups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建一个ILSettingCell
    ILSettingCell *cell = [ILSettingCell settingCellWithTableView:tableView];
    
    // 2.取出这行对应的模型（ILSettingItem）
    ILSettingGroup *group = _allGroups[indexPath.section];
    cell.item = group.items[indexPath.row];
    cell.indexPath = indexPath;
    
    return cell;
}

#pragma mark 点击了cell后的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 0.取出这行对应的模型
    ILSettingGroup *group = _allGroups[indexPath.section];
    ILSettingItem *item = group.items[indexPath.row];
    
    // 1.取出这行对应模型中的block代码
    if (item.operation) {
        // 执行block
        item.operation();
        return;
    }
    
    // 2.检测有没有要跳转的控制器
    if ([item isKindOfClass:[ILSettingArrowItem class]]) {
        ILSettingArrowItem *arrowItem = (ILSettingArrowItem *)item;
        if (arrowItem.showVCClass) {
            UIViewController *vc = [[arrowItem.showVCClass alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark 返回每一组的header标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ILSettingGroup *group = _allGroups[section];
    return group.header;
}
#pragma mark 返回每一组的footer标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ILSettingGroup *group = _allGroups[section];
    return group.footer;
}


@end
