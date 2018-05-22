//
//  UIView+QGHStringTag.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/19.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QGHStringTag)

//字符串tag
@property (nonatomic, strong) NSString *stringTag;

- (UIView *)viewWithStringTag:(NSString *)tag;

- (UIView *)findFirstResponder;

@end
