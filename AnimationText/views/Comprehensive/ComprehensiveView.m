//
//  ComprehensiveView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/19.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "ComprehensiveView.h"

#import "AnimationTextAPI.h"

#import "UIColor+Util.h"

#import "Masonry.h"
#import "BFPaperButton.h"
#import "DCPathButton.h"
#import "DWBubbleMenuButton.h"
#import "MCFireworksButton.h"

@interface ComprehensiveView () <DCPathButtonDelegate>

@property (nonatomic,strong) DCPathButton *pathButton;

@property (nonatomic,strong) DWBubbleMenuButton *dingdingButton;

@property (nonatomic,strong) MCFireworksButton *praiseButton;

@end

@implementation ComprehensiveView {
//    UIView *view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubViews];
        [self pathAnimation];
    }
    return self;
}

- (void)initSubViews {
    
//    view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [self addSubview:view];
    
    NSArray *nameArray = @[@"path",@"钉钉",@"点赞"];
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
            [self pathAnimation];
            break;
        case 1:
            [self dingdingAnimation];
            break;
        case 2:
            [self clickpraiseAnimation];
            break;
        default:
            break;
    }
}

#pragma mark --path
- (void)pathAnimation {
    
    if (_dingdingButton) {
        _dingdingButton.hidden = YES;
    }
    if (_praiseButton) {
        _praiseButton.hidden = YES;
    }
    
    if (!_pathButton) {
        [self ConfigureDCPathButton];
    }else {
        _pathButton.hidden = NO;
    }
}

- (void)ConfigureDCPathButton {
    
    // Configure center button
    //
    _pathButton = [[DCPathButton alloc] initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                          highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    
    _pathButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [_pathButton addPathItems:@[itemButton_1, itemButton_2, itemButton_3, itemButton_4, itemButton_5]];
    _pathButton.frame = CGRectMake(100, 100, 100, 100);
    [self addSubview:_pathButton];
}

#pragma mark --DCPathButtonDelegate
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    
    NSLog(@"%lu",(unsigned long)itemButtonIndex);
}

- (void)willPresentItemButton {
    
    NSLog(@"ItemButton will present");
    
}
- (void)didPresentItemButton {
    
    NSLog(@"ItemButton did present");
    
}

#pragma mark --钉钉
- (void)dingdingAnimation {
    
    if (_pathButton) {
        _pathButton.hidden = YES;
    }
    if (_praiseButton) {
        _praiseButton.hidden = YES;
    }
    
    if (!_dingdingButton) {
        UILabel *homeLabel = [self createHomeButtonView];
        
        DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(self.frame.size.width - homeLabel.frame.size.width - 20.f,
                                                                                             self.frame.size.height - homeLabel.frame.size.height - 20.f,
                                                                                             homeLabel.frame.size.width,
                                                                                              homeLabel.frame.size.height) expansionDirection:DirectionUp];
        upMenuView.homeButtonView = homeLabel;
        [upMenuView addButtons:[self createDDButtonArray]];
        
        _dingdingButton = upMenuView;
        [self addSubview:upMenuView];
    }else {
        _dingdingButton.hidden = NO;
    }
}

- (UILabel *)createHomeButtonView {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    label.text = @"Tap";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.layer.cornerRadius = label.frame.size.height/2;
    label.backgroundColor = [UIColor colorWithHex:0x92CEEF alpha:0.5];
    label.clipsToBounds = YES;
    
    return label;
}

- (NSArray *)createDDButtonArray {
    
    NSMutableArray *buttonArray = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"A",@"B",@"C",@"D",@"E",@"F"]) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 30, 30);
        button.layer.cornerRadius = button.frame.size.height/2;
        button.backgroundColor = [UIColor colorWithHex:0x92CEEF alpha:0.5];
        button.clipsToBounds = YES;
        button.tag = i++;
        [button addTarget:self action:@selector(ddclickbtn:) forControlEvents:UIControlEventTouchUpInside];
        [buttonArray addObject:button];
    }
    
    return buttonArray;
}

- (void)ddclickbtn:(UIButton *)sender {
    
    NSLog(@"%ld",(long)sender.tag);
}

#pragma mark --点赞
- (void)clickpraiseAnimation {
   
    if (_pathButton) {
        _pathButton.hidden = YES;
    }
    if (_dingdingButton) {
        _dingdingButton.hidden = YES;
    }
    
    if (!_praiseButton) {
        _praiseButton = [[MCFireworksButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 25, [UIScreen mainScreen].bounds.size.height/2 - 25, 50, 50)];
        _praiseButton.particleImage = [UIImage imageNamed:@"Sparkle"];
        _praiseButton.particleScale = 0.5;
        _praiseButton.particleScaleRange = 0.2;
        [_praiseButton setImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
        [_praiseButton setImage:[UIImage imageNamed:@"Like-Blue"] forState:UIControlStateSelected];
        [_praiseButton addTarget:self action:@selector(praiseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_praiseButton];
    }else {
        _praiseButton.hidden = NO;
    }
}

- (void)praiseButtonClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        [_praiseButton popOutsideWithDuration:0.5];
    }else {
        [_praiseButton popOutsideWithDuration:0.3];
    }
}

@end
