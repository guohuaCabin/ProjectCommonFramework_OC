//
//  NSObject+QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "NSObject+QGH.h"

static inline dispatch_time_t dTimeDelay(NSTimeInterval time) {
    int64_t delta = (int64_t)(NSEC_PER_SEC * time);
    return dispatch_time(DISPATCH_TIME_NOW, delta);
}

@implementation NSObject (QGH)

-(BOOL)isNotNull{
    if (self == NULL) {//NULL是基本数据类型为空
        return NO;
    }
    
    else if (self == nil)  {//nil是一个对象指针为空
        return NO;
    }
    
    else if (self == Nil) {//Nil是一个类指针为空
        return NO;
    }
    
    else if ([self isEqual:[NSNull null]])  {
        //[NSNull null]用来在NSArray和NSDictionary中加入非nil（表示列表结束）的空值
        return NO;
    }
    
    else if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    return YES;
}
-(BOOL)isNull{
    if (self == NULL) {//NULL是基本数据类型为空
        return YES;
    }
    
    else if (self == nil)  {//nil是一个对象指针为空
        return YES;
    }
    
    else if (self == Nil) {//Nil是一个类指针为空
        return YES;
    }
    
    else if ([self isEqual:[NSNull null]])  {
        //[NSNull null]用来在NSArray和NSDictionary中加入非nil（表示列表结束）的空值
        return YES;
    }
    
    else if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}
+ (BOOL)isNull:(id)obj {
    return ![self isNotNull:obj];
}

+ (BOOL)isNotNull:(id)obj {
    if (obj == NULL) {//NULL是基本数据类型为空
        return NO;
    }
    
    else if (obj == nil)  {//nil是一个对象指针为空
        return NO;
    }
    
    else if (obj == Nil) {//Nil是一个类指针为空
        return NO;
    }
    
    else if ([obj isEqual:[NSNull null]])  {
        //[NSNull null]用来在NSArray和NSDictionary中加入非nil（表示列表结束）的空值
        return NO;
    }
    
    else if ([obj isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    
    return YES;
}


#pragma mark 延迟方法（GCD）

- (void)performOnMainThread:(void(^)(void))block wait:(BOOL)shouldWait {
    if (shouldWait) {
        // Synchronous 同步
        dispatch_sync(dispatch_get_main_queue(), block);
    }
    else {
        // Asynchronous 异步
        dispatch_async(dispatch_get_main_queue(), block);
    }
}
- (void)performAsynchronous:(void(^)(void))block {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, block);
}
- (void)performAfter:(NSTimeInterval)seconds block:(void(^)(void))block {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    //    dispatch_after(popTime, dispatch_get_current_queue(), block);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

#pragma mark 延迟方法

- (void)performDelayOneSecond:(SEL)aSelector {
    [self performSelector:aSelector withObject:nil afterDelay:1];
}

- (void)perform:(SEL)aSelector delay:(NSTimeInterval)delay {
    [self performSelector:aSelector withObject:nil afterDelay:delay];
}

+ (id)performBlock:(void (^)(void))block delay:(NSTimeInterval)delay {
    if (!block) return nil;
    __block BOOL cancelled = NO;
    void (^wrappingBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled)block();
    };
    wrappingBlock = [wrappingBlock copy];
    dispatch_after(dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO); });
    return wrappingBlock;
}

- (id)performBlock:(void (^)(void))block delay:(NSTimeInterval)delay {
    return [NSObject performBlock:block delay:delay];
}

+ (id)performBlock:(void (^)(id arg))block withObject:(id)anObject delay:(NSTimeInterval)delay {
    if (!block) return nil;
    __block BOOL cancelled = NO;
    void (^wrappingBlock)(BOOL, id) = ^(BOOL cancel, id arg) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block(arg);
    };
    wrappingBlock = [wrappingBlock copy];
    dispatch_after(dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO, anObject); });
    return wrappingBlock;
}

- (id)performBlock:(void (^)(id arg))block withObject:(id)anObject delay:(NSTimeInterval)delay {
    return [NSObject performBlock:block withObject:anObject delay:delay];
}

+ (void)cancelBlock:(id)block {
    if (!block) return;
    void (^aWrappingBlock)(BOOL) = (void(^)(BOOL))block;
    aWrappingBlock(YES);
}

+ (void)cancelPreviousPerformBlock:(id)aWrappingBlockHandle {
    [self cancelBlock:aWrappingBlockHandle];
}

@end
