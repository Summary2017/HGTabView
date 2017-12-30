//
//  Public.h
//  HGTabView
//
//  Created by  ZhuHong on 16/3/26.
//  Copyright © 2016年 HG. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 颜色
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r,g,b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#pragma mark - frame
#define HGCGM(X, Y, W, H) CGRectMake((X), (Y), (W), (H))

#define HGStr(...) [NSString stringWithFormat:__VA_ARGS__]

#define HGNotificationCenter [NSNotificationCenter defaultCenter]

/** 获取状态栏的高度 */
#define  HG_STATUS_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)

extern NSString* const HGTabToContentNotification;
extern NSString* const HGContentToTabNotification;
extern NSString* const HGContentTabKey;

@interface Public : NSObject

@end
