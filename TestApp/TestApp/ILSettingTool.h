//
//  ILSettingTool.h
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILSettingTool : NSObject
// 文字的归档，解当
+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

// 开关的归档，解当
+ (BOOL)boolForKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

@end
