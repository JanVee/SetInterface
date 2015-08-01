//
//  ILSettingLabelItem.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILSettingLabelItem.h"
#import "ILSettingTool.h"

@implementation ILSettingLabelItem

- (void)setText:(NSString *)text
{
    _text = text;
    // 归档
    [ILSettingTool setObject:text forKey:self.key];
}

- (void)setKey:(NSString *)key
{
    [super setKey:key];
    key = [ILSettingTool objectForKey:key];
}

@end
