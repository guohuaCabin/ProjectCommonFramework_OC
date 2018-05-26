//
//  LeftImgRightLabView_QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "LeftImgRightLabView_QGH.h"

@interface LeftImgRightLabView_QGH()

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *rightLab;

@end

@implementation LeftImgRightLabView_QGH

-(instancetype)initWithFrame:(CGRect)frame imgViewframe:(CGRect)imgFrame titleFont:(UIFont *)titleFont
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setupViewsWithImgFrame:(CGRect)imgFrame titleFont:(UIFont *)titleFont
{
    _imgView = [self imgF:imgFrame imgName:@""];
    [self addSubview:_imgView];
    
    
    CGFloat rightLabX = _imgView.xw_+AutoW(5);
    CGFloat rightLabW = self.w_ - rightLabX;
    _rightLab = [self labF:Rect(rightLabX, 0, rightLabW, self.h_) text:@"" fsize:0];
    _rightLab.font = titleFont;
    [self addSubview:_rightLab];
    
}

-(void)setTitle:(NSString *)title
{
    _rightLab.text = title;
}
-(void)setTitleColor:(UIColor *)color
{
    _rightLab.textColor = color;
}

-(void)setTitleColor:(UIColor *)color font:(UIFont *)font
{
    _rightLab.textColor = color;
    _rightLab.font = font;
}

-(void)setImgStr:(NSString *)imgStr
{
    
}


@end












