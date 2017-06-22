//
//  UILabel+Compute.h
//  LiveTest
//
//  Created by 任强宾 on 16/9/14.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Compute)

#pragma mark - 计算字符串宽度(单行)
- (CGFloat)getWidth;
#pragma mark - 计算文字绘制所需宽度
- (CGFloat)getWidthWithText:(NSString *)text;
#pragma mark - 计算字符串的高度(单行)
- (CGFloat)getHeight;
#pragma mark - 计算文字绘制所需大小
- (CGSize)getSize;
#pragma mark - 计算文字绘制所需大小
- (CGSize)getSizeWithWidth:(CGFloat)width;
#pragma mark - 计算文字绘制所需高度
+ (CGFloat)getHeightWithFont:(UIFont *)font;
#pragma mark - 计算文字绘制所需宽度
+ (CGFloat)getWidthWithFont:(UIFont *)font text:(NSString *)text;
#pragma mark - 根据字体,宽度绘制所需高度
+ (CGFloat)getHeightWithFont:(UIFont *)font Width:(CGFloat)width text:(NSString *)text;

@end
