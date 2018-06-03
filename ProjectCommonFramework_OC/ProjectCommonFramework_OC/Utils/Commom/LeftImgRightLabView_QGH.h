//
//  LeftImgRightLabView_QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//
//左图片右Lable
#import <UIKit/UIKit.h>

@interface LeftImgRightLabView_QGH : UIView

-(instancetype)initWithFrame:(CGRect)frame imgViewframe:(CGRect)imgFrame titleFont:(UIFont *)titleFont;

-(void)setTitle:(NSString *)title;

-(void)setTitleColor:(UIColor *)color;


-(void)setTitleColor:(UIColor *)color font:(UIFont *)font;


-(void)setImgStr:(NSString *)imgStr;


-(void)setImgUrlStr:(NSString *)imgUrlStr;

@end
