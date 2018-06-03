//
//  TopImgBottomLabView_QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//

//上图片下lable
#import <UIKit/UIKit.h>

@interface TopImgBottomLabView_QGH : UIView

-(void)setTitle:(NSString *)title;

-(void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor;

-(void)setImageStr:(NSString *)imageStr;

-(void)setImageUrlStr:(NSString *)imageUrlStr;

-(void)setTitleLabY:(CGFloat)y height:(CGFloat)height;


@end
