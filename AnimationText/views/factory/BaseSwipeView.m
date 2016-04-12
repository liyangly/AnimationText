//
//  BaseSwipeView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "BaseSwipeView.h"

#import "UIColor+Util.h"

@implementation BaseSwipeView {
    NSArray *itemnameArray;
    NSArray *itemviewArray;
}

- (void)setItemNames:(NSArray *)nameArray andView:(NSArray *)viewArray {
    
    itemnameArray = nameArray;
    itemviewArray = viewArray;
    
    [self initSubViews];
    [self setLayOut];
}

- (void)initSubViews {
    
    NSDictionary *selecttextattributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0],
                                           NSForegroundColorAttributeName:[UIColor themeColor]};
    NSDictionary *unselecttextattributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0],
                                             NSForegroundColorAttributeName:[UIColor blackColor]};
    _swipeBar = [[HMSegmentedControl alloc] initWithSectionTitles:itemnameArray];
    _swipeBar.selectionIndicatorColor = [UIColor themeColor];
    _swipeBar.selectionIndicatorHeight = 2;
    _swipeBar.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, -5, 0);
    _swipeBar.selectedTitleTextAttributes = selecttextattributes;
    _swipeBar.titleTextAttributes = unselecttextattributes;
    _swipeBar.segmentEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
    [_swipeBar addTarget:self action:@selector(swipevalueChange:) forControlEvents:UIControlEventValueChanged];
    _swipeView = [[SwipeView alloc] init];
    _swipeView.dataSource = self;
    _swipeView.delegate = self;
}

- (void)setLayOut {
    
    CGRect selfframe = self.frame;
    float height = 44;
    
    [self addSubview:_swipeBar];
    _swipeBar.frame = CGRectMake(0, 0, selfframe.size.width, height);
    [self addSubview:_swipeView];
    _swipeView.frame = CGRectMake(0, height, selfframe.size.width, selfframe.size.height - height);
}

#pragma mark --swipeview datasource
- (CGSize)swipeViewItemSize:(SwipeView *)swipeView {
    return CGSizeMake(self.frame.size.width, swipeView.frame.size.height);
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView {
    return itemnameArray.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    return (UIView *)itemviewArray[index];
}

#pragma mark --swipe delegate
- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView {
    [_swipeBar setSelectedSegmentIndex:swipeView.currentPage animated:YES];
}

- (void)swipeViewDidEndDecelerating:(SwipeView *)swipeView {
    _swipeBar.selectedSegmentIndex = swipeView.currentPage;
}


- (void)swipevalueChange:(HMSegmentedControl *)sender {
    [_swipeView scrollToItemAtIndex:sender.selectedSegmentIndex duration:0.4];
}

- (void)dealloc {
    _swipeView.dataSource = nil;
    _swipeView.delegate = nil;
}



@end
