//
//  LeftRightLabView_QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/22.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "LeftRightLabView_QGH.h"

@interface LeftRightLabView_QGH()

@property (nonatomic,strong) UILabel *leftLab;
@property (nonatomic,strong) UILabel *rightLab;

@end

@implementation LeftRightLabView_QGH

-(instancetype)initWithFrame:(CGRect)frame leftTitle:(NSString *)leftTitle fontSize:(CGFloat)fontSize
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewsWithLeftTitle:leftTitle fontSize:fontSize];
    }
    return self;
}

-(void)setupViewsWithLeftTitle:(NSString *)leftTitle fontSize:(CGFloat)fontSize
{
    CGFloat space = AutoW(5);
    CGFloat titleLabW = [leftTitle boundingW:self.h_ font:[UIFont systemFontOfSize:fontSize]].width;
    
    _leftLab = [self labF:CGRectMake(0, 0, titleLabW, self.h_) text:leftTitle fsize:fontSize];
    [self addSubview:_leftLab];
    
    CGFloat infoLabW = self.w_-_leftLab.xw_-space;
    _rightLab = [self labF:CGRectMake(_leftLab.xw_+space, 0, infoLabW, self.h_) text:@"--" fsize:0];

    [self addSubview:_rightLab];
}
//set LeftLab
-(void)setLeftLabColor:(UIColor *)leftColor font:(UIFont *)font
{
    _leftLab.textColor = leftColor;
    _leftLab.font = font;
}
//set RightLab
-(void)setRightLabColor:(UIColor *)rightColor font:(UIFont *)font
{
    _rightLab.textColor = rightColor;
    _rightLab.font = font;
}
// LeftLab text
-(void)updateLeftLabWtihText:(NSString *)text
{
    _leftLab.text = text;
}
// RightLab text
-(void)updateRightLabWtihText:(NSString *)text
{
    _rightLab.text = text;
}

// leftTitle and rightTitle
-(void)updateLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle
{
    if (notemptyStr(leftTitle)) {
        _leftLab.text = leftTitle;
    }
    
    if (notemptyStr(rightTitle)) {
        _rightLab.text = rightTitle;
    }
}
// rightLab x
-(void)updateRightLabXSpaceOfLeftLab:(CGFloat)space
{
    [_rightLab setOX:_leftLab.xw_+space];
}

@end
