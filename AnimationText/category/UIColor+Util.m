//
//  UIColor+Util.m
//  AnimationText
//
//  Created by 李阳 on 16/4/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                           blue:((float)(hexValue * 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue {
    
    return [self colorWithHex:hexValue alpha:1.0];
}

#pragma mark --常用颜色
+ (UIColor *)backGroundColor {
    
    return [self colorWithHex:0xEFEFEF];
}

+ (UIColor *)themeColor {
    
    return [self colorWithHex:0x92CEEF];
}

+ (UIColor *)buttonColor {
    
    return [self colorWithHex:0x00A0EA];
}

@end
