//
//  ILTabBarController.m
//  TestApp
//
//  Created by apple on 15/7/30.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ILTabBarController.h"
#import "ILTabBar.h"
#import "UINavigationItem+IL.h"
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
@interface ILTabBarController ()<ILTabBarDelegate>

@end

@implementation ILTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (iOS7) {
        // 1.UIRectEdgeNone不要往四周边缘展开(按照非iOS7的传统来展示)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        // 2.让所有的子控制器都不能展开
        for (UIViewController *vc in self.childViewControllers) {
            vc.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        // NO代表展开的时候不要包含那个条
        //        self.extendedLayoutIncludesOpaqueBars = NO;
    }
    
    // 自动会调用scrollView的contentInsets（比如group样式的tableView的insets.top=64）
    //    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 1.删除默认的tab按钮
        [self.tabBar removeFromSuperview];
        //        for (UIControl *btn in self.tabBar.subviews) {
        //            [btn removeFromSuperview];
        //        }
        
        // 2.创建tabbar
        ILTabBar *myTabBar = [[ILTabBar alloc] init];
        myTabBar.frame = self.tabBar.frame;
        myTabBar.delegate = self;
        [self.view addSubview:myTabBar];
        
        // 3.添加5个按钮
        for (int i = 1; i<=5; i++) {
            NSString *normal = [NSString stringWithFormat:@"TabBar%d", i];
            NSString *selected = [normal stringByAppendingString:@"Sel"];
            [myTabBar addTabBarButton:normal selIcon:selected];
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tabbar代理方法
- (void)tabBar:(ILTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    // 1.根据位置选中某个控制器（这个是UITabBarController自带的API）
    self.selectedIndex = to;
    //    self.selectedViewController = self.childViewControllers[to];
    
    UITableViewController *newVC = self.childViewControllers[to];
    // 2.将新控制器的navigationItem值转移给TabBarController
    [self.navigationItem copyFromItem:newVC.navigationItem];
}

@end
