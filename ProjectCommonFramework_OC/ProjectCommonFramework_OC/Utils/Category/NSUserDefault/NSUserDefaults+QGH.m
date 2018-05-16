//
//  NSUserDefaults+QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "NSUserDefaults+QGH.h"

@implementation NSUserDefaults (QGH)

+ (id)objFoKey:(NSString*)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id value=[defaults objectForKey:key];
    defaults = nil;
    return value;
}

+ (void)setObj:(id)value foKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
    defaults = nil;
}

+ (void)removeObjFoKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
    defaults = nil;
}

+ (void)removeAll {
    NSUserDefaults *udf = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [udf dictionaryRepresentation];
    for (NSString *key in dic.allKeys) {
        [udf removeObjectForKey:key];
    }
}

@end
