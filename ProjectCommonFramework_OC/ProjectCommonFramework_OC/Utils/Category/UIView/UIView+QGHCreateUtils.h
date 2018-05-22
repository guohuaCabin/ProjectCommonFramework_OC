//
//  UIView+QGHCreateUtils.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/19.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QGHCreateUtils)

//create button
-(UIButton *)btnF:(CGRect)frame title:(NSString *)title fsize:(CGFloat)fsize;
//create button :add titleColor
-(UIButton *)btnF:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fsize:(CGFloat)fsize;

//create lable
-(UILabel *)labF:(CGRect)frame text:(NSString *)text fsize:(CGFloat)fsize;
//create lable :add textColor
-(UILabel *)labF:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor fsize:(CGFloat)fsize;
//create imageView
-(UIImageView *)imgF:(CGRect)frame imgName:(NSString *)name;
//create ScrollView
-(UIScrollView *)scrollF:(CGRect)frame;
//create TextField
-(UITextField *)txfF:(CGRect)frame pstr:(NSString *)pstr;
//线
-(UIView *)lineF:(CGRect)frame;

//黑色带三角形的背景图
-(UIView *)triangleArrowViewF:(CGRect)frame arrowImg:(NSString *)arrowImg centX:(CGFloat)x;


@end
