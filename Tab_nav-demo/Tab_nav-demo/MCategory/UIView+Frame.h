//
//  UIView+Frame.h
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/16.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property CGFloat top;
@property CGFloat bottom;
@property CGFloat left;
@property CGFloat right;

@property CGFloat centerX;
@property CGFloat centerY;

@property CGFloat height;
@property CGFloat width;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;
@end
