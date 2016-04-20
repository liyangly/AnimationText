//
//  AnimationGroupView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "AnimationGroupView.h"

#import "AnimationTextAPI.h"

#import "UIColor+Util.h"

#import "Masonry.h"
#import "BFPaperButton.h"

@implementation AnimationGroupView {
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
    
    demoView = [[UIView alloc] initWithFrame:CGRectMake(SelfFrameSizeWidth/2 - 50, SelfFrameSizeHeight/2 - 144, 100, 100)];
    [self addSubview:demoView];
    demoView.backgroundColor = [UIColor themeColor];
    
    NSArray *nameArray = @[@"同时",@"连续"];
    for (int i=0; i<nameArray.count; i++) {
        
        float offsetX = 10 + 50 * i;
        float offsetY = -10;
        
        BFPaperButton *btn = [[BFPaperButton alloc] init];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom).offset(offsetY);
            make.left.mas_equalTo(self.mas_left).offset(offsetX);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        [btn setTitle:nameArray[i] forState:UIControlStateNormal];
        btn.isRaised = YES;
        btn.backgroundColor = [UIColor themeColor];
        [btn addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
    }
}

- (void)clickbtn:(BFPaperButton *)sender {
    
    switch (sender.tag) {
        case 0:
            [self animationGroup1];
            break;
        case 1:
            [self animationGroup2];
            break;
        default:
            break;
    }
}

- (void)animationGroup1 {
    
    CABasicAnimation *animation0 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation0.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    animation0.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 100)];
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation1.fromValue = [NSNumber numberWithFloat:1.0];
    animation1.toValue = [NSNumber numberWithFloat:0.2];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation2.toValue = [NSNumber numberWithFloat:M_PI];
    CABasicAnimation *animation21 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation21.toValue = [NSNumber numberWithFloat:M_PI];
    CABasicAnimation *animation22 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation22.toValue = [NSNumber numberWithFloat:M_PI];
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.toValue = [NSNumber numberWithFloat:0.2];
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation4.toValue = (id)[UIColor redColor].CGColor;
    
    CAAnimationGroup *animationgroup1 = [CAAnimationGroup animation];
    animationgroup1.animations = [NSArray arrayWithObjects:animation0,animation1,animation2,animation21,animation3,animation4, nil];
    animationgroup1.duration = 2.0;
    
    [demoView.layer addAnimation:animationgroup1 forKey:@"animationGroup"];
}

- (void)animationGroup2 {
    CFTimeInterval currenttime = CACurrentMediaTime();
    //通过设置动画开始时间可以达到连续动画的效果
    CABasicAnimation *animation0 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation0.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    animation0.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 100)];
    animation0.beginTime = currenttime;
    animation0.duration = 1.0;
    animation0.removedOnCompletion = NO;
    animation0.fillMode = kCAFillModeBackwards;
    [demoView.layer addAnimation:animation0 forKey:@"0"];
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation1.fromValue = [NSNumber numberWithFloat:1.0];
    animation1.toValue = [NSNumber numberWithFloat:0.2];
    animation1.beginTime = currenttime + 1.0;
    animation1.duration = 1.0;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeBackwards;
    [demoView.layer addAnimation:animation1 forKey:@"1"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation2.toValue = [NSNumber numberWithFloat:M_PI];
    CABasicAnimation *animation21 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation21.toValue = [NSNumber numberWithFloat:M_PI];
    CABasicAnimation *animation22 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation22.toValue = [NSNumber numberWithFloat:M_PI];
    CAAnimationGroup *animationgroup1 = [CAAnimationGroup animation];
    animationgroup1.animations = [NSArray arrayWithObjects:animation2,animation21, nil];
    animationgroup1.duration = 1.0;
    animationgroup1.beginTime = currenttime + 2.0;
    animationgroup1.removedOnCompletion = NO;
    animationgroup1.fillMode = kCAFillModeForwards;
    [demoView.layer addAnimation:animationgroup1 forKey:@"group"];
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.toValue = [NSNumber numberWithFloat:0.2];
    animation3.beginTime = currenttime + 3.0;
    animation3.duration = 1.0;
    animation3.removedOnCompletion = NO;
    animation3.fillMode = kCAFillModeBackwards;
    [demoView.layer addAnimation:animation3 forKey:@"3"];
    
}

@end
