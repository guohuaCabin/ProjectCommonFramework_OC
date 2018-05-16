//
//  Marco_Color.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#ifndef Marco_Color_h
#define Marco_Color_h

#define Scheme_One    1

//MARK: ------------------------颜色宏定义
//16进制颜色
#define LTHEX(rgbValue)    \
                            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                            green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                            blue:((float)(rgbValue & 0xFF))/255.0 \
                            alpha:1.0]
//rgb颜色
#define RGBA(r, g, b, a)        \
                                [UIColor colorWithRed:(CGFloat)r/255.0f \
                                green:(CGFloat)g/255.0f \
                                blue:(CGFloat)b/255.0f \
                                alpha:(CGFloat)a]

#define RGB(r, g, b)                RGBA(r, g, b, 1)

#define QGHColorHex(hexValue)        [UIColor colorFromHex:hexValue]
#define QGHColorHexString(hexValue)  [UIColor colorFromHexString:hexValue]

#define QGHColorHexA(hex, a)         [UIColor colorFromHex:hex alpha:a]
#define QGHColorHexAString(hex, a)   [UIColor colorFromHexString:hex alpha:a];

#define HEXColor(hexValue)          [UIColor colorFromHex:hexValue]
#define HEXStrColor(hexValue)       [UIColor colorFromHexString:hexValue]

//MARK: -------------------------常用颜色
#define QGHBlackColor               [UIColor blackColor]    // 0.0 white
#define QGHDarkGrayColor            [UIColor darkGrayColor]// 0.333 white
#define QGHLightGrayColor           [UIColor lightGrayColor]// 0.667 white
#define QGHWhiteCor                 [UIColor whiteColor]     // 1.0 white
#define QGHGrayColor                [UIColor grayColor]       // 0.5 white
#define QGHRedColor                 [UIColor redColor]        // 1.0, 0.0, 0.0 RGB
#define QGHGreenColor               [UIColor greenColor]// 0.0, 1.0, 0.0 RGB
#define QGHBlueColor                [UIColor blueColor]       // 0.0, 0.0, 1.0 RGB
#define QGHCyanColor                [UIColor cyanColor]// 0.0, 1.0, 1.0 RGB
#define QGHYellowColor              [UIColor yellowColor]// 1.0, 1.0, 0.0 RGB
#define QGHMagentaColor             [UIColor magentaColor]// 1.0, 0.0, 1.0 RGB
#define QGHOrangeColor              [UIColor orangeColor]// 1.0, 0.5, 0.0 RGB
#define QGHPurpleColor              [UIColor purpleColor]// 0.5, 0.0, 0.5 RGB
#define QGHBrownColor               [UIColor brownColor]// 0.6, 0.4, 0.2 RGB
#define QGHClearColor               [UIColor  clearColor]// 0.0 white, 0.0 alpha


#if Scheme_One 
//MARK: ---NavBar and Tabbar 颜色
//#define NarBarOrTabBarColor

//MARK: -------------NavBarColor
    #define NavBarBgColor           LTColorHex(0x24273E)
    #define NavBarTitleColor          WhiteCor
    #define NavBarSubColor          WhiteCor
    #define NavBarBtmLineColor   LTBlackColor

//MARK: -------------TabBarColor
    #define TabBarBgCoror           LTColorHex(0xFFFFFF)
    #define TabBarMaskCoror       LTColorHexA(0xFF0000,0.1)
    #define TabBarSelCoror           LTColorHex(0xF54A40)
    #define TabBarNorCoror          LTColorHex(0x848999)

#else

//MARK: -------------黑色导航Color
    #define NavBarBgCoror           WhiteCor
    #define NavBarTitleCoror        LTTitleColor
    #define NavBarSubCoror          LTTitleColor
    #define NavBarRightTitleCoror   LTBlueFontColor
    #define NavBarBtmLineCoror      ClearColor

//MARK: -------------黑色TabBarColor
    #define TabBarBgCoror           LTColorHex(0x262626)
    #define KlineNavBlackBG         LTColorHex(0x202020)
    #define TabBarSelCoror          RGB(53, 115, 250)
    #define TabBarNorCoror          RGB(97, 95, 119)

#endif




#endif /* Marco_Color_h */





















