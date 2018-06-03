
//
//  Marco_Define.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#ifndef Marco_Define_h
#define Marco_Define_h

/**
 ************** 正式发布 以下都修改为1 **************
 **/
#define DisOrDev        1//生产或测试

/* 是否正式发布  1:正式版本   0:测试版本 */
#define IXIT_RELEASE                 DisOrDev
/* IP地址  1:正式地址   0:测试地址 */
#define IXIT_CONN_RELEASE       DisOrDev
/* 渠道    1:AppStore 0:OtherStore */
#define  Channel_IsAppStore         DisOrDev

/**
 *************************************************
 **/

//测试使用
#define isTest 0

//MARK:-----------------------api链接头部
#if IXIT_CONN_RELEASE
                    //静态域名
                    #define Static_DOMAIN               @""
                    //动态域名
                    #define MOBILE_DOMAIN               @""
                    //长链接域名
                    #define PUSH_HOST_ADDRESS           @""
#else
                    //静态域名
                    #define Static_DOMAIN               @""
                    //动态域名
                    #define MOBILE_DOMAIN               @""
                    //长链接域名
                    #define PUSH_HOST_ADDRESS           @""

#endif

//MARK:-----------------------第三方key
#if IXIT_RELEASE

                    //友盟key
                    #define IMAppKey            @""
                    #define IMCerName           @"devpush"
                    // 友盟统计
                    #define kUmeng_appkey       @""

                    //个推推送
                    #define kGtAppId            @""
                    #define kGtAppSecret        @""
                    #define kGtAppKey           @""
                    //友盟分享
                    #define UMeng_wechatAppID @""
                    #define UMeng_wechatAppSecret @""

                    //QQ
                    #define QQAppId @""
                    #define QQAppKey @""


#else
                    //MARK: -----友盟key
                    #define IMAppKey            @""
                    #define IMCerName           @"devpush"
                    // 友盟统计(假的)
                    #define kUmeng_appkey       @""

                    //个推推送
                    #define kGtAppId            @""
                    #define kGtAppSecret        @""
                    #define kGtAppKey           @""
                    //友盟分享
                    #define UMeng_wechatAppID @""
                    #define UMeng_wechatAppSecret @""
                    //QQ
                    #define QQAppId @""
                    #define QQAppKey @""

#endif

//MARK:-----------------------渠道
#if Channel_IsAppStore
                    #define IXIT_Channel_Name            @"AppStore"
                    #define IXIT_MARKET_CODE             @""
#else
                    #define IXIT_Channel_Name            @"OtherStore"
                    #define IXIT_MARKET_CODE             @""
#endif

//MARK:-----------------------app更新Id
#define APPCONFIG_APPID     @""

#pragma mark - **************** 可能修改的常量
//bugly异常统计
#define kBuglyId @""
#define kAppMarket @"AppStore"
//sourceId
#define kAPPType                    10
//deviceType
#define kDeviceType                2


//是否隐藏交易
#define VersionHideDeal  if([UserInfo hideDeal]) return;

#endif /* Marco_Define_h */











