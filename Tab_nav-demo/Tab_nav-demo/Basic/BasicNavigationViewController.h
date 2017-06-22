//
//  BasicNavigationViewController.h
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicNavigationViewController : UINavigationController
//初始化带返回按钮的导航栏
- (instancetype)initRootViewControllerWithBackButton:(UIViewController *)rootViewController;
@end
