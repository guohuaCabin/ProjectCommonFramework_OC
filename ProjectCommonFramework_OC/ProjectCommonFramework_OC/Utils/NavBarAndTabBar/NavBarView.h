//
//  NavBarView.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/6/2.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BackType)
{
    BackType_No = 0,
    BackType_PopVC,
    BackType_PopToRoot,
    BackType_Dismiss
};

@interface NavBarView : UIView

@property (nonatomic,strong) UILabel *titler;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIButton *leftSecondBtn;

@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,strong) UIButton *rightSecondBtn;

@property (nonatomic,weak) id superController;

@property (nonatomic,strong) UIView *bottomLine;

//初始化
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title isBack:(BOOL)isBack target:(id)superController;

//创建导航栏右按钮（图片）
-(void)createRightBtnWithImgStr:(NSString *)rightImgStr;
//创建导航栏右按钮（文字）
-(void)createRightBtnTitle:(NSString *)rightTitle titleColor:(UIColor *)titleColor;
//创建导航栏右按钮（图片加文字）
-(void)createRightBtnWithTitle:(NSString *)title titleColor:(UIColor *)titleColor imgStr:(NSString *)imgStr isLeftTitle:(BOOL)isLeftTitle;

#pragma mark 背景变化
- (void)changeViewBackgroundColor;
- (void)changeBgImage;

@end














