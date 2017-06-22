//
//  UIImage+Addtions.m
//  Tab_nav-demo
//
//  Created by Mayer on 2017/6/16.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import "UIImage+Addtions.h"

@implementation UIImage (Addtions)
//初始化指定大小的纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (color == nil) {
        return nil;
    }
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
