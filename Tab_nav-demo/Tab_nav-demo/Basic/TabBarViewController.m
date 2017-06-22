//
//  TabBarViewController.m
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import "TabBarViewController.h"
#import "BasicNavigationViewController.h"
#import "MHomeViewController.h"
#import "MSortViewController.h"
#import "MMineViewController.h"
#import "UIImage+Addtions.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTabBar];
    [self addChildViews];
    
    
}
- (void)configTabBar{
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor grayColor] size:CGSizeMake(self.view.bounds.size.width, 10)]];
    self.tabBar.tintColor = [UIColor orangeColor];
    self.delegate = self;
}
// 初始化自子控制器并添加到TabBar
- (void)addChildViews{
    MHomeViewController *homeVC = [[MHomeViewController alloc] init];
    [self addChildVC:homeVC withTitle:@"首页" image:@"tb_home" selectedImage:@"tb_home_selected"];
    MSortViewController *sortVC = [[MSortViewController alloc] init];
    [self addChildVC:sortVC withTitle:@"分类" image:@"tb_discover" selectedImage:@"tb_discover_selected"];
    MMineViewController *mineVC = [[MMineViewController alloc] init];
    [self addChildVC:mineVC withTitle:@"我" image:@"tb_profile" selectedImage:@"tb_profile_selected"];
    
}
//添加子控制器

- (void)addChildVC:(UIViewController *)viewController withTitle:(NSString *)title image:(NSString*)image selectedImage:(NSString *)selectedImage{
    viewController.title = title;
    BasicNavigationViewController *bnavc = [[BasicNavigationViewController alloc] initWithRootViewController:viewController];
    bnavc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    bnavc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    bnavc.tabBarItem.title = title;
    [bnavc.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self addChildViewController:bnavc];
    [bnavc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    [bnavc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
}
#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (self.indexSelected != index) {
        if (index == 3) {
            BasicNavigationViewController *bnac = self.childViewControllers[index];
            [bnac setNavigationBarHidden:YES];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
