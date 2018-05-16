//
//  UIColor+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QGH)

// 返回一个十六进制表示的颜色: @"FF0000" or @"#FF0000"
+ (instancetype)colorFromHexString:(NSString *)hexString;
+ (instancetype)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;
// 返回一个十六进制表示的颜色: 0xFF0000
+ (instancetype)colorFromHex:(int)hex;
+ (instancetype)colorFromHex:(int)hex alpha:(CGFloat)alpha;
// 返回颜色的十六进制string
- (NSString *)hexString;
// 数组内容依次是：r, g, b, a .
- (NSArray *)rgbaArray;
// 根据自己的颜色,返回黑色或者白色
- (instancetype)blackOrWhiteContrastingColor;

#pragma mark - 颜色转图片
- (UIImage *)imageFromUIColor;

@end
