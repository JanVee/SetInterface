//
//  ILSettingCell.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILSettingCell.h"
#import "ILSettingItem.h"
#import "ILSettingSwitchItem.h"
#import "ILSettingArrowItem.h"
#import "ILSettingLabelItem.h"
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
const int ILCellMargin = 10;

@interface ILSettingCell ()
{
    UIImageView *_arrow; // 箭头
    UISwitch *_switch; // 开关
    UILabel *_label;  // 文字说明
    UIView *_divider; // 分割线
}

@end

@implementation ILSettingCell

// 初始化开启
+ (instancetype)settingCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    ILSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ILSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.设置背景
        [self setupBg];
        
        // 2.设置子控件属性
        [self setupSubviews];
        
        // 3.添加分隔线
        [self setupDivider];
    }
    return self;
}

#pragma mark 设置背景
- (void)setupBg
{
    // 1.默认
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    // 2.选中
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = [UIColor colorWithRed:237/255.0 green:233/255.0 blue:218/255.0 alpha:1];
    self.selectedBackgroundView = selectedBg;
}

#pragma mark 设置子控件属性
- (void)setupSubviews
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
}

#pragma mark 添加分隔线
- (void)setupDivider
{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    // 不能在这里设置分隔线的x值（原因：cell没有具体的数据，里面的label就不知道最终的位置）
    //    divider.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 1.5);
    [self.contentView addSubview:divider];
    _divider = divider;
}

// 拦截行数，进行设置分割线的显示或者隐藏
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    _divider.hidden = indexPath.row == 0; // 第一行不存在分割线
}

// 拦截设置item, 设置内容数据
- (void)setItem:(ILSettingItem *)item
{
    _item = item;
    
    // 设置数据
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subtitle;
    
    if ([item isKindOfClass:[ILSettingArrowItem class]]) {
        [self settingArrow];
    } else if ([item isKindOfClass:[ILSettingSwitchItem class]]) {
        [self settingSwitch];
    } else if ([item isKindOfClass:[ILSettingLabelItem class]]) {
        [self settingLabel];
    } else {
        // 什么也没有，清空右边显示的view
        self.accessoryView = nil;
        // 用默认的选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

#pragma mark 当cell的宽高改变了就会调用
// 需要调节cell内部子控件的frame，在layoutSubviews方法最可靠\最有效
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 0.设置分隔线的位置
    _divider.frame = CGRectMake(self.textLabel.frame.origin.x, 0, self.contentView.frame.size.width + 100, 1.2);
    
    if (iOS7) return;
    
    // 1.cell的frame
    CGRect cellF = self.frame;
    cellF.origin.x = -ILCellMargin;
    CGFloat deltaW = ILCellMargin * 2;
    cellF.size.width = [UIScreen mainScreen].bounds.size.width + deltaW;
    self.frame = cellF;
    
    // 2.右边控件的frame
    CGRect accessF = self.accessoryView.frame;
    accessF.origin.x = cellF.size.width - accessF.size.width - deltaW;
    self.accessoryView.frame = accessF;
}

#pragma mark 设置右边的箭头
- (void)settingArrow
{
    if (_arrow == nil) {
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    // 右边的箭头
    self.accessoryView = _arrow;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

#pragma mark 设置右边的开关
- (void)settingSwitch
{
    if (_switch == nil) {
        _switch = [[UISwitch alloc] init];
        [_switch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    // 设置开关的状态
    ILSettingSwitchItem *switchItem = (ILSettingSwitchItem *)_item;
    // 初始化赋值
    _switch.on = !switchItem.off;
    
    self.accessoryView = _switch;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)switchChange
{
    ILSettingSwitchItem *switchItem = (ILSettingSwitchItem *)_item;
    switchItem.off = !_switch.on;
}

#pragma mark 设置右边的文本标签
- (void)settingLabel
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.bounds = CGRectMake(0, 0, 100, self.frame.size.height);
        _label.textAlignment = NSTextAlignmentRight;
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor colorWithRed:173/255.0 green:69/255.0 blue:14/255.0 alpha:1];
        _label.font = [UIFont systemFontOfSize:13];
    }
    
    // 设置右边label的值
    ILSettingLabelItem *labelItem = (ILSettingLabelItem *)_item;
    _label.text = labelItem.text;
    
    // 右边显示开关
    self.accessoryView = _label;
    // 禁止选中
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
