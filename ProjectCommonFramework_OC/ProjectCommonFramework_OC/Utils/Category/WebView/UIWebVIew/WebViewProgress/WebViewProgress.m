//
//  WebViewProgress.m
//  Canary
//
//  Created by 秦国华 on 2018/3/7.
//  Copyright © 2018年 litong. All rights reserved.
//

#import "WebViewProgress.h"

@implementation WebViewProgress
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    self.backgroundColor = lineColor;
}

-(void)startLoadingAnimation{
    self.hidden = NO;
    [self setSW:ScreenW * 0.2] ;
    
    WS(ws);
    [UIView animateWithDuration:0.4 animations:^{
        [ws setSW:ScreenW * 0.6] ;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            [ws setSW:ScreenW * 0.8] ;
        }];
    }];
    
}

-(void)endLoadingAnimation{
    WS(ws);
    [UIView animateWithDuration:0.2 animations:^{
        [ws setSW:ScreenW] ;
    } completion:^(BOOL finished) {
        ws.hidden = YES;
    }];
}


@end
