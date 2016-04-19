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
#import "ComprehensiveView.h"

#import "UIColor+Util.h"

#import "Masonry.h"

@interface HomePageViewController () {
    BaseSwipeView *swipeview;
    BaseAnimationView *baseanimationview;
    KeyframeAnimationView *keyframeanimationview;
    AnimationGroupView *animationgroupview;
    TransitionView *transitionview;
    ComprehensiveView *comprehensiveView;
    
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"动画效果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSubViews];
    
}

- (void)initSubViews {
    
    swipeview = [[BaseSwipeView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-20)];
    baseanimationview = [[BaseAnimationView alloc] init];
    keyframeanimationview = [[KeyframeAnimationView alloc] init];
    animationgroupview = [[AnimationGroupView alloc] init];
    transitionview = [[TransitionView alloc] init];
    comprehensiveView = [[ComprehensiveView alloc] init];
    NSArray *nameArray = @[@"基础动画",
                           @"关键帧动画",
                           @"组动画",
                           @"过渡动画",
                           @"综合动画"];
    NSArray *viewArray = @[baseanimationview,
                           keyframeanimationview,
                           animationgroupview,
                           transitionview,
                           comprehensiveView];
    [swipeview setItemNames:nameArray andView:viewArray];
    [self.view addSubview:swipeview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
