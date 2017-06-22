//
//  BasicNavigationViewController.m
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import "BasicNavigationViewController.h"

@interface BasicNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BasicNavigationViewController
- (instancetype)initRootViewControllerWithBackButton:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        rootViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"allback"] style:UIBarButtonItemStylePlain target:self action:@selector(handleDismiss:)];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.backgroundColor = [UIColor grayColor];
    
}
- (void)handleDismiss:(UINavigationController *)navigationController{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
