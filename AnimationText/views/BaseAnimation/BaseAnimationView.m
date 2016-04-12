//
//  BaseAnimationView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "BaseAnimationView.h"

#import "AnimationTextAPI.h"

#import "UIColor+Util.h"

#import "Masonry.h"
#import "BFPaperButton.h"

@implementation BaseAnimationView {
    UIView *demoview;
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
    
    demoview = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width/2 - 50, ScreenSize.height/2 - 100-44, 100, 100)];
    [self addSubview:demoview];
    demoview.backgroundColor = [UIColor themeColor];
    
    NSArray *titleArray = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
    for (int i=0; i < 5; i++) {
        
        float offsetX;
        float offsetY;
        if (i < 4) {
            offsetY = -40;
            offsetX = ((ScreenSize.width-40)/4 + 10)*i + 5;
        }else {
            offsetY = -10;
            offsetX = 5;
        }
        BFPaperButton *btn = [[BFPaperButton alloc] init];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom).offset(offsetY);
            make.left.mas_equalTo(self.mas_left).offset(offsetX);
            make.width.mas_equalTo((ScreenSize.width-30)/4);
            make.height.mas_equalTo(20);
        }];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.isRaised = YES;
        btn.layer.cornerRadius = 2;
        btn.backgroundColor = [UIColor themeColor];
        [btn addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
    }
    
    
}

- (void)clickbtn:(BFPaperButton *)sender {
    
    switch (sender.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAnimation];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundColorAnimation];
            break;
        default:
            break;
    }
}

- (void)positionAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, ScreenSize.height/2 - 100)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(ScreenSize.width, ScreenSize.height/2 - 100)];
    animation.duration = 1.0;
    
    [demoview.layer addAnimation:animation forKey:@"positionAnimation"];
}

- (void)opacityAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:0.1];
    animation.duration = 1.0;
    
    [demoview.layer addAnimation:animation forKey:@"opacityAnimation"];
}

- (void)scaleAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:0.2];
    animation.duration = 1.0;
    
    [demoview.layer addAnimation:animation forKey:@"scaleAnimation"];
}

- (void)rotateAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.toValue = [NSNumber numberWithFloat:M_PI];
    animation.duration = 1.0;
    
    [demoview.layer addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)backgroundColorAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (id)[UIColor redColor].CGColor;
    animation.duration = 1.0;
    
    [demoview.layer addAnimation:animation forKey:@"backgroundColorAnimation"];
}

@end
