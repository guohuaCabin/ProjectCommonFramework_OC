//
//  UIView+QGHGesture.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QGHGesture)

#pragma mark - 手势 UIGestureRecognizer

//单击、双击、多次点击、长按
- (void)addSingeTap:(SEL)sel target:(id)target;
- (void)addDoubleTap:(SEL)sel target:(id)target;
- (void)addTap:(NSInteger)numTap action:(SEL)action target:(id)target;
- (void)addSingeTap:(SEL)action andDoubleTap:(SEL)doubleSel target:(id)target;
- (void)addLongPressAction:(SEL)action second:(NSTimeInterval)second target:(id)target;
//上、下、左、右滑
- (void)addUpSwipeAction:(SEL)action target:(id)target;
- (void)addDownSwipeAction:(SEL)action target:(id)target;
- (void)addLeftSwipeAction:(SEL)action target:(id)target;
- (void)addRightSwipeAction:(SEL)action target:(id)target;

@end
