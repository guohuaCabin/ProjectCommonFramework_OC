//
//  NSUserDefaults+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UserDefaults  [NSUserDefaults standardUserDefaults]
#define UD_SetObjForKey(obj,key)    [NSUserDefaults setObj:obj foKey:key]
#define UD_ObjForKey(key)               [NSUserDefaults objFoKey:key]
#define UD_RemoveForKey(key)    [NSUserDefaults removeObjFoKey:key]

@interface NSUserDefaults (QGH)

//取值
+ (id)objFoKey:(NSString*)key;
//设值
+ (void)setObj:(id)value foKey:(NSString *)key;
//删除
+ (void)removeObjFoKey:(NSString *)key;

+ (void)removeAll;


@end
