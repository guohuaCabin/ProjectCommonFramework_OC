//
//  UIView+QGHFrame.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UIView+QGHFrame.h"

@implementation UIView (QGHFrame)

- (CGFloat)x_ {
    return self.frame.origin.x;
}

- (CGFloat)y_ {
    return self.frame.origin.y;
}

- (CGFloat)w_ {
    return self.frame.size.width;
}

- (CGFloat)h_ {
    return self.frame.size.height;
}

- (CGFloat)xw_ {
    return self.x_ + self.w_;
}

- (CGFloat)yh_ {
    return self.y_ + self.h_;
}

#pragma mark - 设置Frame、Center

- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}
- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (void)setOX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (void)setOY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (void)setSW:(CGFloat)w {
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}
- (void)setSH:(CGFloat)h {
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}

- (void)setCenterX:(CGFloat)x {
    CGPoint p = self.center;
    p.x = x;
    self.center = p;
}
- (void)setCenterY:(CGFloat)y {
    CGPoint p = self.center;
    p.y = y;
    self.center = p;
}

- (void)centerXSameToView:(UIView *)view {
    self.center = CGPointMake(view.center.x, self.center.y);
}
- (void)centerYSameToView:(UIView *)view {
    self.center = CGPointMake(self.center.x, view.center.y);
}

#pragma mark - 获取当前View的ViewController
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}


#pragma mark - removeAllSubView

- (void)removeAllSubView {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)removeAllSubViewWithClass:(Class)clas {
    for (id view in self.subviews) {
        if ([view isKindOfClass:clas]) {
            [view removeFromSuperview];
        }
    }
}

#pragma mark - 坐标转换

- (CGPoint)centerConvertToView:(UIView *)aView {
    CGPoint point = [aView convertPoint:self.center fromView:self.superview];
    //    CGPoint point = [self.superview convertPoint:self.center toView:aView];//等价于上面的方法
    return point;
}

- (CGRect)rectConvertToView:(UIView *)aView {
    CGRect rect = [aView convertRect:self.frame fromView:self.superview];
    //    CGRect rect = [self.superview convertRect:self.frame toView:aView];
    return rect;
}

@end
