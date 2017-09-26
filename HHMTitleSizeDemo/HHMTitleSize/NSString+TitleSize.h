//
//  NSString+TitleSize.h
//  HHMTitleSizeDemo
//
//  Created by Hehuimin on 2017/9/26.
//  Copyright © 2017年 haoshiqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (TitleSize)

/*! 正常计算height方法
 */
+ (CGFloat)heightText: (NSString *)text inWidth: (CGFloat)width font: (UIFont *)font;

/*! 设置了行间距
 */
+ (CGFloat)heightText:(NSString *)text inWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;

/*! 设置行间距并限制显示行数
 */
+ (CGFloat)heightText:(NSString *)text inWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing lines:(int)lines;

@end
