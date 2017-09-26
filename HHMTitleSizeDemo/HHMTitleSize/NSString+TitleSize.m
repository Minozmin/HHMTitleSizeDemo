//
//  NSString+TitleSize.m
//  HHMTitleSizeDemo
//
//  Created by Hehuimin on 2017/9/26.
//  Copyright © 2017年 haoshiqi. All rights reserved.
//

#import "NSString+TitleSize.h"

@implementation NSString (TitleSize)

/*! 正常计算height方法
 */
+ (CGFloat)heightText:(NSString *)text inWidth:(CGFloat)width font:(UIFont *)font
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return ceilf(rect.size.height);
}

/*! 设置了行间距
 */
+ (CGFloat)heightText:(NSString *)text inWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing
{
    NSMutableDictionary *mDictionary = [[NSMutableDictionary alloc] init];
    [mDictionary setObject:font forKey:NSFontAttributeName];
    [mDictionary setObject:[NSNumber numberWithInt:0] forKey:NSBaselineOffsetAttributeName];
    if (lineSpacing) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpacing;
        [mDictionary setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:mDictionary context:nil];
    
    CGFloat spacing = rect.size.height - font.lineHeight;
    if (spacing <= lineSpacing && spacing > 0) {
        return ceilf(font.lineHeight);
    }
    return ceilf(rect.size.height);
}

/*! 设置行间距并限制显示行数
 */
+ (CGFloat)heightText:(NSString *)text inWidth:(CGFloat)width font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing lines:(int)lines
{
    if (lines < 0) {
        return 0;
    }
    
    CGFloat height = [self heightText:text inWidth:width font:font lineSpacing:lineSpacing];
    
    if (lines == 0) {
        return ceil(height);
    }
    
    CGFloat maximumHeight = font.lineHeight * lines + MAX(lineSpacing * (lines - 1), 10);
    if (height >= maximumHeight) {
        return ceilf(maximumHeight);
    }
    return ceilf(height);
}

@end
