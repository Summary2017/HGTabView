//
//  NSString+HG.h
//  HGTabView
//
//  Created by  ZhuHong on 16/3/27.
//  Copyright © 2016年 HG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (HG)

/** 计算文字的size
 font  : 文本的字体的大小
 width : 允许最长的宽
 height: 允许最长的高
 */
- (CGSize)hgStringWithFont:(UIFont*)font width:(CGFloat)width height:(CGFloat)height;

@end
