//
//  TopBottomLabView_QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "TopBottomLabView_QGH.h"

@interface TopBottomLabView_QGH()

@property (nonatomic,strong) UILabel *topLab;
@property (nonatomic,strong) UILabel *bottomLab;

@end

@implementation TopBottomLabView_QGH

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
    
}

-(void)setupViews
{
    _topLab = [self labF:CGRectMake(0, 0, self.w_, AutoW(14)) text:@"--" fsize:AutoW(14)];
    _topLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_topLab];
    
    _bottomLab = [self labF:CGRectMake(0, _topLab.yh_+AutoW(5), self.w_, AutoW(16)) text:@"--" fsize:AutoW(12)];
    [self addSubview:_bottomLab];
}

-(void)updateViewWithTopTitle:(NSString *)topTitle bottomTitle:(NSString *)bottomTitle
{
    if (notemptyStr(topTitle)) {
        _topLab.text = topTitle;
    }
    if (notemptyStr(bottomTitle)) {
        _bottomLab.text = bottomTitle;
    }
}

-(void)setBottomLabColor:(UIColor *)textColor font:(UIFont *)font
{
    _bottomLab.textColor = textColor;
    _bottomLab.font = font;
}

-(void)setTopLabColor:(UIColor *)textColor font:(UIFont *)font
{
    _topLab.textColor = textColor;
    _topLab.font = font;
}

-(void)setTopLabY:(CGFloat)topLabY height:(CGFloat)height
{
    [_topLab setSH:height];
    [_topLab setOY:topLabY];
}

-(void)setbottomLabY:(CGFloat)bottomLabY height:(CGFloat)height
{
    [_bottomLab setSH:height];
    [_bottomLab setOY:_topLab.yh_+bottomLabY];
}

@end
