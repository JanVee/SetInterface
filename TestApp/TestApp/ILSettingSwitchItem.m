//
//  ILSettingSwitchItem.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILSettingSwitchItem.h"
#import "ILSettingTool.h"

@implementation ILSettingSwitchItem

- (void)setKey:(NSString *)key
{
    [super setKey:key];
    // 取出纪录的状态
    _off = [ILSettingTool boolForKey:key];
}

- (void)setOff:(BOOL)off
{
    _off = off;
    [ILSettingTool setBool:off forKey:self.key];
}

@end
