//
//  BasicViewController.m
//  Tab_nav-demo
//
//  Created by Mayer on 2017/4/15.
//  Copyright © 2017年 QMK. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()
@property (nonatomic, strong) NSMutableArray *leftBarBtnArray;
@property (nonatomic, strong) NSMutableArray *rightBarBtnArray;
@end

@implementation BasicViewController

#pragma mark - view 的生命周期
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basicConfig]; //BasicVC的基础配置
    
    [self configChildViews];
    
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar endEditing:YES];
    [self.view endEditing:YES];
}
//解决侧滑失效的问题
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
//子类重写父类
- (void)configChildViews{
    
}
- (void)basicConfig{
    self.view.backgroundColor = [UIColor yellowColor];
    
    //统一设置导航栏返回按钮
    if (self.navigationController.childViewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"allback"] style:UIBarButtonItemStylePlain target:self action:@selector(handlePop)];
        self.hidesBottomBarWhenPushed = YES;
    }
   
}
//左侧按钮 -- pop
- (void)handlePop{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

//左侧按钮 -- dismiss
- (void)handleDismiss{
     [self dismissViewControllerAnimated:YES completion:nil];
}
//设置导航栏图片按钮
- (void)addLeftButton:(UIButton *)button action:(SEL)action{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.leftBarBtnArray addObject:barButtonItem];
    if (_leftBarBtnArray.count > 2) {
        [_leftBarBtnArray removeLastObject];
    }
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = _leftBarBtnArray;
}
- (void)addRightButton:(UIButton *)button action:(SEL)action{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.rightBarBtnArray addObject:barButtonItem];
    if (_rightBarBtnArray.count > 2) {
        [_rightBarBtnArray removeLastObject];
    }
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = _rightBarBtnArray;
}






#pragma mark - 懒加载
- (NSMutableArray *)leftBarBtnArray{
    if (!_leftBarBtnArray) {
        self.leftBarBtnArray = [NSMutableArray array];
    }
    return _leftBarBtnArray;
}

- (NSMutableArray *)rightBarBtnArray{
    if (!_rightBarBtnArray) {
        self.rightBarBtnArray = [NSMutableArray array];
    }
    return _rightBarBtnArray;
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
