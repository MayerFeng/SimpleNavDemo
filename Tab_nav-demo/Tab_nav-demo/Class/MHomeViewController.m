//
//  MHomeViewController.m
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import "MHomeViewController.h"
#import "MMButton.h"
#import "SearchViewController.h"

@interface MHomeViewController ()

@end

@implementation MHomeViewController

//子类重写父类的方法

- (void)configChildViews{
    [super configChildViews];

    MMButton *rightBtn = [[MMButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44) imageStyle:MMBtnImageStyleDefault layoutStyle:MMBtnLayoutStyleNone font:nil title:nil image:[UIImage imageNamed:@"tb_discover"] space:0 offset:0 autoSize:NO];
    
    [self addRightButton:rightBtn action:@selector(searchClick)];
    
    MMButton *rightBtnT = [[MMButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44) imageStyle:MMBtnImageStyleDefault layoutStyle:MMBtnLayoutStyleNone font:nil title:nil image:[UIImage imageNamed:@"tb_discover"] space:0 offset:0 autoSize:NO];
    [self addRightButton:rightBtnT action:@selector(searchClick)];
   
  
    
}
- (void)searchClick{
    SearchViewController *sVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:sVC animated:YES];
    
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
