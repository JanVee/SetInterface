//
//  ILSettingItem.h
//  TestApp
//
//  Created by apple on 15/7/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILSettingItem : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) void (^operation)();

+ (id)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (id)itemWithTitle:(NSString *)title;

@end
