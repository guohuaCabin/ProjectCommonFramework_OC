//
//  WKWebVC.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/16.
//  Copyright © 2018 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BackType)
{
    BackType_Non = 0,//无返回
    BackType_PopVC ,
    BackType_Dismiss ,
    BackType_PopToRoot ,
};

@interface WKWebVC : UIViewController

@property(copy,nonatomic)NSString * titler;
@property(copy,nonatomic)NSString * shareUrl;
@property(copy,nonatomic)NSString * content;

@property (nonatomic,assign) BOOL canScroll;

/** 是否开启返回上一个网页，默认不开启  */
@property (nonatomic,assign) BOOL useGoBack;
//默认返回pop
- (instancetype)initWithTitle:(NSString*)title url:(NSURL*)url;
- (instancetype)initWithTitle:(NSString*)title url:(NSURL*)url returnType:(BackType)returnType;

//重新设置title和web url
- (void)webWithTitle:(NSString*)title url:(NSURL*)url;

//重新设置title 和 url 、返回方式
- (void)webWithTitle:(NSString*)title url:(NSURL*)url backType:(BackType)backType;
//重新设置返回方式
- (void)configBackType:(BackType)backType;

@end
