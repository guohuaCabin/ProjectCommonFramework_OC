//
//  UIView+QGHCreateUtils.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/19.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UIView+QGHCreateUtils.h"

@implementation UIView (QGHCreateUtils)

-(UIButton *)btnF:(CGRect)frame title:(NSString *)title fsize:(CGFloat)fsize{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:fsize];
    return btn;
}

-(UIButton *)btnF:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fsize:(CGFloat)fsize
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:fsize];
    return btn;
}

-(UILabel *)labF:(CGRect)frame text:(NSString *)text fsize:(CGFloat)fsize{
    UILabel *label=[[UILabel alloc]init];
    label.frame=frame;
    label.text=text;
    label.textAlignment=NSTextAlignmentLeft;
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:fsize];
    return label;
}
//create lable :add textColor
-(UILabel *)labF:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor fsize:(CGFloat)fsize
{
    UILabel *label=[[UILabel alloc]init];
    label.frame=frame;
    label.text=text;
    label.textAlignment=NSTextAlignmentLeft;
    label.numberOfLines=0;
    label.textColor = textColor;
    label.font=[UIFont systemFontOfSize:fsize];
    return label;
}
-(UIImageView *)imgF:(CGRect)frame imgName:(NSString *)name{
    UIImageView *imgv=[[UIImageView alloc]init];
    if (notemptyStr(name)) {
        imgv.image=[UIImage imageNamed:name];
    }
    imgv.frame=frame;
    return imgv;
}
-(UIScrollView *)scrollF:(CGRect)frame{
    UIScrollView *scroll=[[UIScrollView alloc]init];
    scroll.frame=frame;
    scroll.showsVerticalScrollIndicator=NO;
    scroll.bounces=NO;
    return scroll;
}
-(UITextField *)txfF:(CGRect)frame pstr:(NSString *)pstr{
    UITextField *txf=[[UITextField alloc]initWithFrame:frame];
    txf.font=[UIFont systemFontOfSize:AutoW(15)];
    return txf;
}
-(UIView *)lineF:(CGRect)frame{
    UIView *line=[[UIView alloc]init];
    line.frame=frame;
    return line;
}

-(UIView *)triangleArrowViewF:(CGRect)frame arrowImg:(NSString *)arrowImg centX:(CGFloat)x
{
    UIView *arrowV=[[UIView alloc]initWithFrame:frame];
    //三角形
    UIImageView *imgv=[self imgF:Rect(x-8, 0, 16, 5) imgName:arrowImg];
    [arrowV addSubview:imgv];
    
    CGRect vf=frame;
    vf.origin.y=imgv.h_;
    vf.size.height=frame.size.height- imgv.h_;
    UIView *bgView=[[UIView alloc]initWithFrame:vf];
    [arrowV addSubview:bgView];
    return arrowV;
}

@end
