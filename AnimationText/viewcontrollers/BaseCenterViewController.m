//
//  BaseViewController.m
//  AnimationText
//
//  Created by 李阳 on 16/4/19.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "BaseCenterViewController.h"

#import "AnimationTextAPI.h"


#import "BaseSwipeView.h"
#import "BaseAnimationView.h"
#import "KeyframeAnimationView.h"
#import "AnimationGroupView.h"
#import "TransitionView.h"
#import "ComprehensiveView.h"

#import "UIColor+Util.h"

#import "Masonry.h"
#import "SWRevealViewController.h"

@interface BaseCenterViewController () {
    
    BaseSwipeView *myswipeview;
    BaseAnimationView *baseanimationview;
    KeyframeAnimationView *keyframeanimationview;
    AnimationGroupView *animationgroupview;
    TransitionView *transitionview;
    ComprehensiveView *comprehensiveView;
    
}

@end

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
    
    float swipewidth = self.view.bounds.size.width - 40;
    float swipeheight = self.view.bounds.size.height-64-20;
    float swipebarheight = 44;
    myswipeview = [[BaseSwipeView alloc] initWithFrame:CGRectMake(20, 64, swipewidth, swipeheight)];
    baseanimationview = [[BaseAnimationView alloc] initWithFrame:CGRectMake(0, 0, swipewidth, swipeheight - swipebarheight)];
    keyframeanimationview = [[KeyframeAnimationView alloc] initWithFrame:CGRectMake(0, 0, swipewidth, swipeheight - swipebarheight)];
    animationgroupview = [[AnimationGroupView alloc] initWithFrame:CGRectMake(0, 0, swipewidth, swipeheight - swipebarheight)];
    transitionview = [[TransitionView alloc] initWithFrame:CGRectMake(0, 0, swipewidth, swipeheight - swipebarheight)];
    comprehensiveView = [[ComprehensiveView alloc] initWithFrame:CGRectMake(0, 0, swipewidth, swipeheight - swipebarheight)];
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
    [myswipeview setItemNames:nameArray andView:viewArray];
    [self.view addSubview:myswipeview];
    
    if (_itemindex) {
        
        myswipeview.swipeBar.selectedSegmentIndex = _itemindex;
        myswipeview.swipeView.currentItemIndex = _itemindex;
        [myswipeview.swipeBar setSelectedSegmentIndex:myswipeview.swipeView.currentPage animated:YES];
    }
    
}


@end
