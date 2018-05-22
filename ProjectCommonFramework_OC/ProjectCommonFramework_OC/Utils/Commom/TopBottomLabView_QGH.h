//
//  TopBottomLabView_QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//
//上下Lable
#import <UIKit/UIKit.h>

@interface TopBottomLabView_QGH : UIView

/**
 set bottomLab textColor and font
 
 @param textColor textColor
 @param font font
 */
-(void)setBottomLabColor:(UIColor *)textColor font:(UIFont *)font;

/**
 set topLab textColor and font
 
 @param textColor textColor
 @param font font
 */
-(void)setTopLabColor:(UIColor *)textColor font:(UIFont *)font;

/**
 set topLab y and height
 
 @param topLabY topLabY
 @param height height
 */
-(void)setTopLabY:(CGFloat)topLabY height:(CGFloat)height;

/**
 set bottomLab y and height
 
 @param bottomLabY bottomLabY
 @param height height
 */
-(void)setbottomLabY:(CGFloat)bottomLabY height:(CGFloat)height;

/**
 update topTitle and bottomTitle
 
 @param topTitle topTitle
 @param bottomTitle bottomTitle
 */
-(void)updateViewWithTopTitle:(NSString *)topTitle bottomTitle:(NSString *)bottomTitle;

@end
