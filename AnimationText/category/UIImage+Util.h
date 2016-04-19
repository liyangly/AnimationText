//
//  UIImage+Util.h
//  AnimationText
//
//  Created by 李阳 on 16/4/19.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)

+ (UIImage *) imageWithColor:(UIColor *)color;

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

- (UIImage *)scaleToSize:(CGSize)size;

@end
