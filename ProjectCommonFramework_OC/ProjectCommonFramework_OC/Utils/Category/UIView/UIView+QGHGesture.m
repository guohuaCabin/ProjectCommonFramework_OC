//
//  UIView+QGHGesture.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UIView+QGHGesture.h"

@implementation UIView (QGHGesture)

- (void)addSingeTap:(SEL)sel target:(id)target {
    [self addTap:1 action:sel target:target];
}
- (void)addDoubleTap:(SEL)sel target:(id)target {
    [self addTap:2 action:sel target:target];
}
- (void)addTap:(NSInteger)numTap action:(SEL)action target:(id)target {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tapRecognizer.numberOfTapsRequired = numTap;
    [self addGestureRecognizer:tapRecognizer];
}
- (void)addSingeTap:(SEL)action andDoubleTap:(SEL)doubleSel target:(id)target {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tapRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapRecognizer];
    
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:target action:doubleSel];
    tapRecognizer2.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapRecognizer2];
    
    [tapRecognizer requireGestureRecognizerToFail:tapRecognizer2];
}
- (void)addLongPressAction:(SEL)action second:(NSTimeInterval)second target:(id)target {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:target action:action];
    longPress.minimumPressDuration = second;
    [self addGestureRecognizer:longPress];
}

- (void)addUpSwipeAction:(SEL)action target:(id)target {
    [self addSwipeAction:action target:self direction:UISwipeGestureRecognizerDirectionUp];
}
- (void)addDownSwipeAction:(SEL)action target:(id)target {
    [self addSwipeAction:action target:self direction:UISwipeGestureRecognizerDirectionDown];
}
- (void)addLeftSwipeAction:(SEL)action target:(id)target {
    [self addSwipeAction:action target:self direction:UISwipeGestureRecognizerDirectionLeft];
}
- (void)addRightSwipeAction:(SEL)action target:(id)target {
    [self addSwipeAction:action target:self direction:UISwipeGestureRecognizerDirectionRight];
}

- (void)addSwipeAction:(SEL)sel target:(id)target direction:(UISwipeGestureRecognizerDirection)direction {
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:sel];
    swipeGestureRecognizer.direction = direction;
    [self addGestureRecognizer:swipeGestureRecognizer];
}


@end
