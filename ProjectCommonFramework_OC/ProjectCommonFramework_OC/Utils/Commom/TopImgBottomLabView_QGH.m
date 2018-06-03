//
//  TopImgBottomLabView_QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "TopImgBottomLabView_QGH.h"

@interface TopImgBottomLabView_QGH()

@property (nonatomic,assign) CGRect imgFrame;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,assign) UIFont *titleFont;


@end

@implementation TopImgBottomLabView_QGH

-(instancetype)initWithFrame:(CGRect)frame imgFrame:(CGRect)imgFrame titleFont:(UIFont *)titleFont
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgFrame = imgFrame;
        _titleFont = titleFont;
        [self setupViews];
    }
    return self;
}

-(void)setupViews
{
    _imageView = [self imgF:_imgFrame imgName:@""];
    [self addSubview:_imageView];
    
    CGFloat titleLabH = self.h_ - _imageView.yh_-AutoW(5);
    _titleLab = [self labF:CGRectMake(0, _imageView.yh_+AutoW(5), self.w_, titleLabH) text:@"" fsize:0];
    _titleLab.font = _titleFont;
    [self addSubview:_titleLab];
    
}

-(void)setTitle:(NSString *)title
{
    _titleLab.text = title;
}

-(void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor
{
    _titleLab.text = title;
    _titleLab.textColor = titleColor;
}

-(void)setImageStr:(NSString *)imageStr
{
    if (notemptyStr(imageStr)) {
        _imageView.image = [UIImage imageNamed:imageStr];
    }
}

-(void)setImageUrlStr:(NSString *)imageUrlStr
{
    if (notemptyStr(imageUrlStr)) {
        UIImage *image = [UIImage imgUrlStr:imageUrlStr];
        _imageView.image = image;
    }
}

-(void)setTitleLabY:(CGFloat)y height:(CGFloat)height
{
    [_titleLab setOY:_imageView.yh_+y];
    [_titleLab setSH:height];
}

@end










