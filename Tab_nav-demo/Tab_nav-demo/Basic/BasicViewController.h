//
//  BasicViewController.h
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController<UIGestureRecognizerDelegate>


//子类重写(添加子视图)
- (void)configChildViews;
//设置导航栏图片按钮
- (void)addLeftButton:(UIButton*)image action:(SEL)action;
- (void)addRightButton:(UIButton *)image action:(SEL)action;


//左侧按钮 -- dismiss
- (void)handleDismiss;
@end
