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
    NSInteger index;
    UILabel *demoLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubViews];
        index = 0;
    }
    return self;
}

- (void)initSubViews {
    
    demoView = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width/2 - 50, ScreenSize.height/2 - 144, 100, 100)];
    [self addSubview:demoView];
    demoView.backgroundColor = [UIColor themeColor];
    
    demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [demoView addSubview:demoLabel];
    demoLabel.textAlignment = NSTextAlignmentCenter;
    
    float offsetX,offsetY;
    NSArray *nameArray = @[@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose"];
    for (int i=0; i<12; i++) {
        
        offsetX = 5 + ((ScreenSize.width - 40)/4 + 10) * (i%4);
        offsetY = (i/4) * 30;
        
        BFPaperButton *btn = [[BFPaperButton alloc] init];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-80 + offsetY);
            make.left.mas_equalTo(offsetX);
            make.width.mas_equalTo((ScreenSize.width - 40)/4);
            make.height.mas_equalTo(20);
        }];
        [btn setTitle:nameArray[i] forState:UIControlStateNormal];
        btn.isRaised = YES;
        btn.layer.cornerRadius = 2;
        btn.backgroundColor = [UIColor themeColor];
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
    }
    
}

- (void)btnclick:(BFPaperButton *)sender {
    
    switch (sender.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimtion];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleAnimation];
            break;
        case 8:
            [self pageCurlAnimtion];
            break;
        case 9:
            [self pageUnCurlAnimation];
            break;
        case 10:
            [self caOpenAnimation];
            break;
        case 11:
            [self caCloseAnimation];
            break;
        default:
            break;
    }
}

#pragma mark -- CATransition 渐变效果
- (void)fadeAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = kCATransitionFade;
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"fadeAnimation"];
}

- (void)moveInAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = kCATransitionMoveIn;
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"moveInanimation"];
    
}

- (void)pushAnimtion {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = kCATransitionPush;
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"pushAnimation"];
}

- (void)revealAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = kCATransitionReveal;
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"revealAnimation"];
}

#pragma mark -- CATransition 立体翻转效果
- (void)cubeAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"cube";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"cubeAnimation"];
}

- (void)suckAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"suckEffect";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"suckEffectAnimation"];
}

- (void)oglFlipAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"oglFlip";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"oglFlipAnimation"];
}

- (void)rippleAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"ripple";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"rippleAnimation"];
}

- (void)pageCurlAnimtion {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"pageCurl";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"pageCurlAnimation"];
}

- (void)pageUnCurlAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"pageUnCurl";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"pageUnCurlAnimation"];
}

- (void)caOpenAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"cameraIrisHollowOpen";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"cameraIrisHollowOpenAnimation"];
    
}

- (void)caCloseAnimation {
    
    [self changeView:YES];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"cameraIrisHollowClose";
    anim.subtype = kCATransitionFromRight;
    anim.duration = 1.0;
    [demoView.layer addAnimation:anim forKey:@"cameraIrisHollowCloseAnimation"];
}

- (void)changeView:(BOOL)isUp {
    
    if (index < 0) {
        index = 3;
    }else if(index > 3){
        index = 0;
    }
    
    NSArray *colorArray = @[[UIColor cyanColor],
                            [UIColor magentaColor],
                            [UIColor orangeColor],
                            [UIColor purpleColor]];
    demoView.backgroundColor = [colorArray objectAtIndex:index];
    demoLabel.text = [NSString stringWithFormat:@"%ld",(long)index];
    
    if (isUp) {
        index++;
    }else {
        index--;
    }
    
}



@end
