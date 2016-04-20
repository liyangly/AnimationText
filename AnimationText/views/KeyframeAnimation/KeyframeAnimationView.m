//
//  KeyframeAnimationView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "KeyframeAnimationView.h"

#import "AnimationTextAPI.h"

#import "UIColor+Util.h"

#import "Masonry.h"
#import "BFPaperButton.h"

@implementation KeyframeAnimationView {
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
    
    demoview = [[UIView alloc] initWithFrame:CGRectMake(SelfFrameSizeWidth/2 - 50, SelfFrameSizeHeight/2 - 100-44, 100, 100)];
    [self addSubview:demoview];
    demoview.backgroundColor = [UIColor themeColor];
    
    NSArray *nameArray = @[@"关键帧",@"路径",@"抖动"];
    for (int i=0; i < 3; i++) {
        
        float offsetX,offsetY;
        offsetX = (((SelfFrameSizeWidth - 40)/3 + 10) * i) + 5;
        offsetY = -10;
        BFPaperButton *btn = [[BFPaperButton alloc] init];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom).offset(offsetY);
            make.left.mas_equalTo(self.mas_left).offset(offsetX);
            make.width.mas_equalTo((SelfFrameSizeWidth - 30)/3);
            make.height.mas_equalTo(20);
        }];
        [btn setTitle:nameArray[i] forState:UIControlStateNormal];
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
            [self keyframeAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
            break;
        default:
            break;
    }
}

- (void)keyframeAnimation {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SelfFrameSizeWidth/2 - 50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, SelfFrameSizeWidth/2 - 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(100, SelfFrameSizeWidth/2)];
    animation.values = [NSArray arrayWithObjects:value0,value1,value2, nil];
    animation.duration = 3.0;
    animation.delegate = self;//监听动画的开始和结束
    
    [demoview.layer addAnimation:animation forKey:@"keyframeAnimation"];
    
}

- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

- (void)pathAnimation {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 100, SelfFrameSizeWidth, 200)];
    animation.path = path.CGPath;
    animation.duration = 2.0;
    
    [demoview.layer addAnimation:animation forKey:@"pathAnimation"];
}

- (void)shakeAnimation {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    NSValue *value0 = [NSNumber numberWithFloat:-M_PI/180 *4];
    NSValue *value1 = [NSNumber numberWithFloat:M_PI/180 *4];
    NSValue *value2 = [NSNumber numberWithFloat:-M_PI/180 *4];
    animation.values = @[value0,value1,value2];
    animation.repeatCount = MAXFLOAT;
    
    [demoview.layer addAnimation:animation forKey:@"shakeAnimation"];
}






@end
