//
//  Macro_Constant.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#ifndef Macro_Constant_h
#define Macro_Constant_h

//MARK: ----------------------------打印
#ifdef DEBUG

#define NSLog(...) NSLog(__VA_ARGS__)
#define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define NSLog(...) {}
#define DLog( s, ... )

#endif


//MARK: ----------------------------恒定常量
#define WS(weakSelf) __weak typeof(self) weakSelf = self;

#define AppKeyWindow     [UIApplication sharedApplication].keyWindow
#define ShutAllKeyboard     [[[UIApplication sharedApplication] keyWindow] endEditing:YES]


#endif /* Macro_Constant_h */

















