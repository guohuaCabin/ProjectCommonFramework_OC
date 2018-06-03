//
//  BaseVCtrl.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/6/2.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavBarView.h"
//#import "TabBarView.h"
@interface BaseVCtrl : UIViewController
//状态栏
@property (nonatomic, strong) UIView *stateView;
// 导航视图
@property (nonatomic, strong) NavBarView *navBarView;
// 底部导航视图
//@property (nonatomic, strong) TabBarView *footer;
//返回方式
@property (nonatomic,assign) BackType backType;

//backType返回按钮 & 中间文字
- (void)navTitle:(NSString *)title backType:(BackType)backType;

//backType返回按钮 & 中间文字 & 右按钮文字
- (void)navTitle:(NSString *)title backType:(BackType)backType rightTitle:(NSString *)rightTitle;

- (void)navTitle:(NSString *)title backType:(BackType)backType rightTitle:(NSString *)rightTitle rightTitleColor:(UIColor *)rightTitleColor;

//backType返回按钮 & 中间文字 & 右按钮图片
- (void)navTitle:(NSString *)title backType:(BackType)backType rightImgName:(NSString *)rightImgName;

//创建状态栏背景view
-(void)createStatusViewWithBgColor:(UIColor *)BgColor;

//创建导航栏右侧文字按钮
-(void)createRightBt:(NSString *)rightTitle titleColor:(UIColor *)titleColor;
//创建导航栏右按钮
-(void)createRightBtWithImg:(NSString *)imgName;

//配置导航栏背景颜色和文字颜色
-(void)configNavBarWithNavBgColor:(UIColor *)navBgColor navTitleColor:(UIColor *)navTitleColor;

//状态栏背景view背景颜色
-(void)configStatusViewWithBgColor:(UIColor *)BgColor;


#pragma mark - action
-(void)initAction;
//点击左按钮时调用，默认返回前一页，子类可重载
- (void)leftAction;
//点击右按钮时调用，空方法，仅供子类重载
- (void)rightAction;

@end

















