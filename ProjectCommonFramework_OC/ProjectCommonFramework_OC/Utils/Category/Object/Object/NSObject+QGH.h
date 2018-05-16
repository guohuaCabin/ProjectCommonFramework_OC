//
//  NSObject+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (QGH)

- (BOOL)isNull;
- (BOOL)isNotNull;

+ (BOOL)isNull:(id)obj;
+ (BOOL)isNotNull:(id)obj;

#pragma mark 延迟方法（GCD）

- (void)performOnMainThread:(void(^)(void))block wait:(BOOL)shouldWait;
- (void)performAsynchronous:(void(^)(void))block;
- (void)performAfter:(NSTimeInterval)seconds block:(void(^)(void))block;

#pragma mark 延迟方法

- (void)performDelayOneSecond:(SEL)aSelector;
- (void)perform:(SEL)aSelector delay:(NSTimeInterval)delay;

+ (id)performBlock:(void (^)(void))block delay:(NSTimeInterval)delay;
- (id)performBlock:(void (^)(void))block delay:(NSTimeInterval)delay;
+ (id)performBlock:(void (^)(id arg))block withObject:(id)anObject delay:(NSTimeInterval)delay;
- (id)performBlock:(void (^)(id arg))block withObject:(id)anObject delay:(NSTimeInterval)delay;
+ (void)cancelBlock:(id)block;
+ (void)cancelPreviousPerformBlock:(id)aWrappingBlockHandle;

@end
