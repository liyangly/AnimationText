//
//  BaseSwipeView.h
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HMSegmentedControl.h"
#import "SwipeView.h"

@interface BaseSwipeView : UIView<SwipeViewDataSource,SwipeViewDelegate>

@property (nonatomic,strong) HMSegmentedControl *swipeBar;
@property (nonatomic,strong) SwipeView *swipeView;

- (void)setItemNames:(NSArray *)nameArray andView:(NSArray *)viewArray;

@end
