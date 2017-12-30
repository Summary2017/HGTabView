//
//  NSString+HG.m
//  HGTabView
//
//  Created by  ZhuHong on 16/3/27.
//  Copyright © 2016年 HG. All rights reserved.
//

#import "NSString+HG.h"

@implementation NSString (HG)

/** 计算文字的size
 font  : 文本的字体的大小
 width : 允许最长的宽
 height: 允许最长的高
 */
- (CGSize)hgStringWithFont:(UIFont*)font width:(CGFloat)width height:(CGFloat)height {
    NSDictionary* dict = @{NSFontAttributeName:font};
    CGSize size =  [self boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return size;
}

@end
