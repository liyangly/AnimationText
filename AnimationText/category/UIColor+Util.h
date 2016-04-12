//
//  UIColor+Util.h
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

+ (UIColor *)backGroundColor;
+ (UIColor *)themeColor;
+ (UIColor *)buttonColor;

@end
