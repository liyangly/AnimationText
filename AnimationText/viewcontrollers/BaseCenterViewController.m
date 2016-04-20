//
//  BaseViewController.m
//  AnimationText
//
//  Created by 李阳 on 16/4/19.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "BaseCenterViewController.h"

#import "AnimationTextAPI.h"

#import "HomePageViewController.h"

#import "Masonry.h"
#import "SWRevealViewController.h"

@implementation BaseCenterViewController

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
    
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)click:(UIButton *)sender {
    [self.navigationController pushViewController:[HomePageViewController new] animated:YES];
}

@end
