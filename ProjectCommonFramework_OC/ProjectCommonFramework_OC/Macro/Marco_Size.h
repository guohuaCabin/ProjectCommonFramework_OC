//
//  Marco_Size.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#ifndef Marco_Size_h
#define Marco_Size_h

//状态栏
#define StatusBarH        ([UIApplication sharedApplication].statusBarFrame.size.height)
//导航栏
#define NavBarH                 (44.0)
//状态栏+导航栏
#define NavBarTop               (StatusBarH+NavBarH)
//工具栏
#define TabBarH                 (IPhoneX? 84:50.0)
//状态栏+导航栏+工具栏
#define NavAndTabBarH           (NavBarTop + TabBarH)
//底部安全距离
#define BottomSafeM        (IPhoneX?34:0)
// 横屏 左边离 留海距离
#define Hor_Safe_Left (IPhoneX ? 44 : 0)
// 横屏 底部距离 home键 距离
#define Hor_Safe_Bottom (IPhoneX ? 21 : 0)
// 横屏 右边边离 安全区 距离
#define Hor_Safe_Right (IPhoneX ? 34 : 0)


//全屏幕的bounds
#define ScreenBounds           [[UIScreen mainScreen] bounds]
#define ScreenSize              ScreenBounds.size
#define ScreenW                 ScreenSize.width
#define ScreenH                 ScreenSize.height

#define Iphone6W       375.0
#define Iphone6H       667.0
//自适应大小
#define AutoW(w)                ((1.0*(w))*(ScreenW/Iphone6W))
#define AutoH(h)                  ((h)*(ScreenH/Iphone6H))

#define Rect(a,b,c,d)       CGRectMake(a, b, c, d)

#endif /* Marco_Size_h */










