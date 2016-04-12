//
//  HomePageViewController.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "HomePageViewController.h"

#import "BaseSwipeView.h"
#import "BaseAnimationView.h"
#import "KeyframeAnimationView.h"
#import "AnimationGroupView.h"
#import "TransitionView.h"
#import "PathMenuView.h"
#import "NailMenuView.h"
#import "PraiseView.h"

#import "UIColor+Util.h"

#import "Masonry.h"

@interface HomePageViewController () {
    BaseSwipeView *swipeview;
    BaseAnimationView *baseanimationview;
    KeyframeAnimationView *keyframeanimationview;
    AnimationGroupView *animationgroupview;
    TransitionView *transitionview;
    PathMenuView *pathmenuview;
    NailMenuView *nailmenuview;
    PraiseView *praiseview;
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画效果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSubViews];
    // Do any additional setup after loading the view.
}

- (void)initSubViews {
    
    swipeview = [[BaseSwipeView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-128)];
    baseanimationview = [[BaseAnimationView alloc] init];
    keyframeanimationview = [[KeyframeAnimationView alloc] init];
    animationgroupview = [[AnimationGroupView alloc] init];
    transitionview = [[TransitionView alloc] init];
    pathmenuview = [[PathMenuView alloc] init];
    nailmenuview = [[NailMenuView alloc] init];
    praiseview = [[PraiseView alloc] init];
    NSArray *nameArray = @[@"基础动画",
                           @"关键帧动画",
                           @"组动画",
                           @"过渡动画",
                           @"仿path菜单效果",
                           @"仿丁丁菜单效果",
                           @"点赞烟花效果"];
    NSArray *viewArray = @[baseanimationview,
                           keyframeanimationview,
                           animationgroupview,
                           transitionview,
                           pathmenuview,
                           nailmenuview,
                           praiseview];
    [swipeview setItemNames:nameArray andView:viewArray];
    [self.view addSubview:swipeview];
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
