//
//  LeftRightLabView_QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//
//左右Lable
#import <UIKit/UIKit.h>

@interface LeftRightLabView_QGH : UIView

/**
 set LeftLab

 @param leftColor leftColor
 @param font font
 */
-(void)setLeftLabColor:(UIColor *)leftColor font:(UIFont *)font;

/**
 set RightLab

 @param rightColor rightColor
 @param font font
 */
-(void)setRightLabColor:(UIColor *)rightColor font:(UIFont *)font;

/**
 LeftLab text

 @param text text
 */
-(void)updateLeftLabWtihText:(NSString *)text;

/**
 RightLab text

 @param text text
 */
-(void)updateRightLabWtihText:(NSString *)text;

/**
 leftTitle and rightTitle

 @param leftTitle leftTitle
 @param rightTitle rightTitle
 */
-(void)updateLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

/**
 set rightLab x

 @param space From the leftLab space
 */
-(void)updateRightLabXSpaceOfLeftLab:(CGFloat)space;

@end
