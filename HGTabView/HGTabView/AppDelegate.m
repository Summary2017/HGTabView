//
//  AppDelegate.m
//  HGTabView
//
//  Created by  ZhuHong on 16/3/22.
//  Copyright © 2016年 HG. All rights reserved.
//

#import "AppDelegate.h"
#import "HGViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
    // 设置rootVC
    HGViewController* hgVC = [[HGViewController alloc] init];
    UINavigationController* hgNav = [[UINavigationController alloc] initWithRootViewController:hgVC];
    self.window.rootViewController = hgNav;
    // key并可视
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
