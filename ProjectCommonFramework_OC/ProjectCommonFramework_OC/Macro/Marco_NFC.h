//
//  Marco_NFC.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#ifndef Marco_NFC_h
#define Marco_NFC_h

//MARK: 通知方法

//发送通知
#define   NFC_PostName(name) [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil]
//添加通知
#define   NFC_AddObserver(Name,Selct)  [[NSNotificationCenter defaultCenter] addObserver:self selector:Selct name:Name object:nil]
//移除通知
#define   NFC_RemoveObserver(Name)  [[NSNotificationCenter defaultCenter] removeObserver:self name:Name object:nil]
//移除所有通知
#define   NFC_RemoveAllObserver [[NSNotificationCenter defaultCenter] removeObserver:self]


#endif /* Marco_NFC_h */
