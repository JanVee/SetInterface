//
//  ILSettingTool.m
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#define ILUserDefaults [NSUserDefaults standardUserDefaults]
#import "ILSettingTool.h"

@implementation ILSettingTool

+ (id)objectForKey:(NSString *)defaultName
{
    return [ILUserDefaults objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [ILUserDefaults setObject:value forKey:defaultName];;
    [ILUserDefaults synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [ILUserDefaults boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [ILUserDefaults setBool:value forKey:defaultName];
    [ILUserDefaults synchronize];
}

@end
