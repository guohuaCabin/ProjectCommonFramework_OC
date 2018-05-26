//
//  QGH_ObjcRuntime.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/26.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <Foundation/Foundation.h>

//根据类名称获取类
//系统就提供 NSClassFromString(NSString *clsname)

//获取一个类的所有属性名字:类型的名字，具有@property的, 父类的获取不了！
NSDictionary *GetPropertyListOfObject(NSObject *object);
NSDictionary *GetPropertyListOfClass(Class cls);

void Swizzle(Class c, SEL origSEL, SEL newSEL);
