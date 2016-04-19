//
//  BaseViewController.m
//  AnimationText
//
//  Created by 李阳 on 16/4/19.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "BaseViewController.h"

#import "AnimationTextAPI.h"

#import "SWRevealViewController.h"
#import "HomePageViewController.h"

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"默认标题";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
}

- (void)initViews {
    
    //注册该页面可以执行滑动切换
    SWRevealViewController *swrevealVC = self.revealViewController;
    [self.view addGestureRecognizer:swrevealVC.panGestureRecognizer];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)click:(UIButton *)sender {
    [self.navigationController pushViewController:[HomePageViewController new] animated:YES];
}

@end
