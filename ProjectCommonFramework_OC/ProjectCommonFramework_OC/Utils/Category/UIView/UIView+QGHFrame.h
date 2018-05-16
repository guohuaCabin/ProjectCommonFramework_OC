//
//  UIView+QGHFrame.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QGHFrame)

@property(nonatomic,readonly)CGFloat x_;
@property(nonatomic,readonly)CGFloat y_;
@property(nonatomic,readonly)CGFloat w_;
@property(nonatomic,readonly)CGFloat h_;

@property(nonatomic,readonly)CGFloat xw_;        //x+width
@property(nonatomic,readonly)CGFloat yh_;         //y+heiht


#pragma mark - 设置Frame、Center

- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;

- (void)setOX:(CGFloat)x;
- (void)setOY:(CGFloat)y;
- (void)setSW:(CGFloat)w;
- (void)setSH:(CGFloat)h;

- (void)setCenterX:(CGFloat)x;
- (void)setCenterY:(CGFloat)y;

//self.centerX=view.centerX
- (void)centerXSameToView:(UIView *)view;
- (void)centerYSameToView:(UIView *)view;

#pragma mark - 获取当前View的ViewController
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC;

#pragma mark - 移除view上所有子view

- (void)removeAllSubView;
- (void)removeAllSubViewWithClass:(Class)cls;


#pragma mark - 坐标转换

//当前view中心点 转换成相对于aView坐标系下的CGPoint
- (CGPoint)centerConvertToView:(UIView *)aView;
//当前view 转换成相对于aView坐标系下的CGRect
- (CGRect)rectConvertToView:(UIView *)aView;

@end
