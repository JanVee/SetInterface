//
//  ILTabBar.h
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILTabBar;

@protocol ILTabBarDelegate <NSObject>

@optional

- (void)tabBar:(ILTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end

@interface ILTabBar : UIView
@property (nonatomic, weak) id<ILTabBarDelegate> delegate;
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon;
@end
