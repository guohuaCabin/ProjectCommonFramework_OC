//
//  NavBarView.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/6/2.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "NavBarView.h"

@interface NavBarView()

@property (nonatomic,assign) CGFloat navBarW;
@property (nonatomic,assign) CGFloat navBarH;

@property (nonatomic,copy) NSString *navTitle;
@property (nonatomic,assign) BOOL isBack;

@property (nonatomic,strong) UIImageView *bgImgView;

@end

@implementation NavBarView
//初始化
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title isBack:(BOOL)isBack target:(id)superController
{
    self = [super initWithFrame:frame];
    if (self) {
        _navBarW = frame.size.width;
        _navBarH = frame.size.height;
        _navTitle = title;
        _isBack = isBack;
        _superController = superController;
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    CGFloat titlerX =  AutoW(60);
    if (!_titler) {
        CGFloat titlerW = _navBarW - titlerX*2;
        _titler = [[UILabel alloc]initWithFrame:CGRectMake(titlerX, 0, titlerW, _navBarH)];
        _titler.textAlignment = NSTextAlignmentCenter;
        _titler.font = [UIFont boldSystemFontOfSize:AutoW(17)];
        _titler.textColor = NavBarTitleColor;
        _titler.backgroundColor = [UIColor clearColor];
        _titler.text = _navTitle;
        [self addSubview:_titler];
    }
    if (!_backButton && _isBack) {
        CGFloat leftSpace = AutoW(10);
        UIImage *backImg = [UIImage imageNamed:@""];
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, titlerX, _navBarH)];
        [_backButton setImage:backImg forState:UIControlStateNormal];
        [_backButton addTarget:_superController action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, leftSpace, 0, 0);
        [self addSubview:_backButton];
    }
    
    _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, _navBarH-0.5, _navBarW, 0.5)];
    _bottomLine.backgroundColor = NavBarBtmLineColor;
    [self addSubview:_bottomLine];
    
    [self changeViewBackgroundColor];
}
//创建导航栏右按钮（图片）
-(void)createRightBtnTitle:(NSString *)rightTitle titleColor:(UIColor *)titleColor
{
    if (!_rightBtn) {
        CGFloat sizeFont = AutoW(15);
        UIFont *font = [UIFont boldSystemFontOfSize:sizeFont];
        UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBt setTitle:rightTitle forState:UIControlStateNormal];
        rightBt.titleLabel.font = font;
        [rightBt setTitleColor:titleColor forState:UIControlStateNormal];
        [rightBt addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
        rightBt.backgroundColor = [UIColor clearColor];
        CGSize size = [rightTitle boundingW:sizeFont font:font];
        CGFloat rightBtnW = size.width +5;
        CGFloat rightBtnX = _titler.frame.origin.x+_titler.frame.size.width;
        
        _rightBtn = rightBt;
        _rightBtn.frame = CGRectMake(rightBtnX, 0, rightBtnW, NavBarH);
        
        [self addSubview:_rightBtn];
        
    }
}
//创建导航栏右按钮（文字）
-(void)createRightBtnWithImgStr:(NSString *)rightImgStr
{
    if (notemptyStr(rightImgStr)) {
        if (!self.rightBtn) {
            CGFloat rightBtnX = _titler.frame.origin.x+_titler.frame.size.width;
            UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
            rightBt.frame = CGRectMake(rightBtnX, 0, NavBarH, NavBarH);
            [rightBt addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
            rightBt.backgroundColor = [UIColor clearColor];
            [rightBt setImage:[UIImage imageNamed:rightImgStr] forState:UIControlStateNormal];
             _rightBtn = rightBt;
            [self addSubview:_rightBtn];
        }
    }
}
//创建导航栏右按钮（图片加文字）
-(void)createRightBtnWithTitle:(NSString *)title titleColor:(UIColor *)titleColor imgStr:(NSString *)imgStr isLeftTitle:(BOOL)isLeftTitle
{
    if (!_rightBtn) {
        CGFloat sizeFont = AutoW(15);
        UIFont *font = [UIFont boldSystemFontOfSize:sizeFont];
        UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBt setTitle:title forState:UIControlStateNormal];
        rightBt.titleLabel.font = font;
        [rightBt setTitleColor:titleColor forState:UIControlStateNormal];
        [rightBt addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
        rightBt.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
        CGSize size = [title boundingW:sizeFont font:font];
        CGFloat rightBtnW = size.width +10;
        rightBt.backgroundColor = [UIColor clearColor];
        CGFloat rightBtnX = _titler.frame.origin.x+_titler.frame.size.width;
        rightBt = rightBt;
        rightBt.frame = CGRectMake(rightBtnX, 0, rightBtnW, NavBarH);
        if (notemptyStr(imgStr)) {
            [rightBt setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
            [rightBt setTitleAndImageWithLeftTitle:isLeftTitle interval:3];
        }
        
        [self addSubview:_rightBtn];
        
    }
}

#pragma mark - **************** Action
- (void)leftAction
{
    // 子类中重写该方法
}

-(void)rightAction
{
    // 子类中重写该方法
}

#pragma mark 背景变化

- (void)changeViewBackgroundColor
{
    self.backgroundColor = NavBarBgColor;
    self.titler.textColor = NavBarTitleColor;
}

- (void)changeBgImage
{

}


@end













