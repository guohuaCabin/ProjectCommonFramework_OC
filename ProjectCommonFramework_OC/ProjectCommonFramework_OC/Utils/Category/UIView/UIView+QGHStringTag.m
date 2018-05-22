//
//  UIView+QGHStringTag.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/19.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UIView+QGHStringTag.h"
#import <objc/runtime.h>

static char kQGHViewStringTag;

@implementation UIView (QGHStringTag)

- (void)setStringTag:(NSString *)stringTag{
    objc_setAssociatedObject(self, &kQGHViewStringTag, stringTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)stringTag{
    
    return objc_getAssociatedObject(self, &kQGHViewStringTag);
}

- (UIView *)viewWithStringTag:(NSString *)tag{
    
    UIView *targetView = nil;
    for (UIView *view in self.subviews) {
        
        if ([view.stringTag isEqualToString:tag]) {
            targetView = view;
            break;
        }else{
            targetView = [view viewWithStringTag:tag];
            if (targetView) {
                break;
            }
        }
    }
    
    return targetView;
}

- (UIView *)findFirstResponder {
    UIView *firstResponder = nil;
    if (self.isFirstResponder) {
        firstResponder = self;
    } else {
        for (UIView *view in self.subviews) {
            if (view.isFirstResponder) {
                firstResponder = view;
                break;
            } else {
                firstResponder = [view findFirstResponder];
                if (firstResponder) {
                    break;
                }
            }
        }
    }
    return firstResponder;
}

@end
