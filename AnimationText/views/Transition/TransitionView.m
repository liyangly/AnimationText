//
//  TransitionView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "TransitionView.h"

#import "AnimationTextAPI.h"

#import "UIColor+Util.h"

#import "Masonry.h"
#import "BFPaperButton.h"

@implementation TransitionView {
    UIView *demoView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    demoView = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width/2 - 50, ScreenSize.height/2 - 75, 100, 100)];
    [self addSubview:demoView];
    
    float offsetX,offsetY;
    NSArray *nameArray = @[@"fade",@"movein",@"push",@"reveal",@"club",@"suck",@"oglflip",@"ripple",@"curl",@"uncurl",@"caopen",@"caclose"];
    for (int i=0; i<12; i++) {
        
        offsetX = 5 + ((ScreenSize.width - 40)/4 + 10) * i;
        
    }
    
}



@end
