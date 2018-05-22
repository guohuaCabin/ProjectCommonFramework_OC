//
//  UILabel+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/19.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QGH)

/**
 创建一个UILabel

 @param frame 坐标
 @param text title
 @param color 颜色
 @param font 字体
 @param textAlignment 文字对齐方向
 @return 返回一个UILabel
 */
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                             text:(NSString*)text
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment;

/**
 *  创建一个动态高度的UILabel
 *
 *  @param pointX        Label的横坐标
 *  @param pointY        Label的纵坐标
 *  @param width         Label的宽度
 *  @param strContent    内容
 *  @param color         字体颜色
 *  @param font          字体大小
 *  @param textAlignmeng 对齐方式
 *
 *  @return 返回一个UILabel
 */
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                               strContent:(NSString *)strContent
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng;

@end
