//
//  WebViewProgress.h
//  Canary
//
//  Created by 秦国华 on 2018/3/7.
//  Copyright © 2018年 litong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewProgress : UIView

//进度条颜色
@property (nonatomic,strong) UIColor  *lineColor;

-(instancetype)initWithFrame:(CGRect)frame;

//开始加载
-(void)startLoadingAnimation;

//结束加载
-(void)endLoadingAnimation;

@end
