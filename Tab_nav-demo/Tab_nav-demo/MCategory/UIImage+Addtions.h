//
//  UIImage+Addtions.h
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/16.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addtions)
//初始化指定大小的纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
