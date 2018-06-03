//
//  BaseVCtrl.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/6/2.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "BaseVCtrl.h"

@interface BaseVCtrl ()

@property (nonatomic,assign) BOOL isBack;

@end

@implementation BaseVCtrl

-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.view.backgroundColor = QGHWhiteCor;
    //防黑屏
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSideslipMannerWithEnable:YES];
}

-(void)setSideslipMannerWithEnable:(BOOL)enable
{
//    if (IOS7_OR_LATER)
//    {
    self.navigationController.interactivePopGestureRecognizer.enabled = enable;      // 手势有效设置为YES  无效为NO
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;    // 手势的代理设置为self
//    }
}

#pragma mark - **************** NavBarView
//backType返回按钮 & 中间文字
- (void)navTitle:(NSString *)title backType:(BackType)backType
{
    _isBack = (backType>0);
    self.backType = backType;
    
    _navBarView = [[NavBarView alloc]initWithFrame:CGRectMake(0, StatusBarH, ScreenW, NavBarH) title:title isBack:_isBack target:self];
    [self.view addSubview:self.navBarView];
    
}

//backType返回按钮 & 中间文字 & 右按钮文字
- (void)navTitle:(NSString *)title backType:(BackType)backType rightTitle:(NSString *)rightTitle
{
    [self navTitle:title backType:backType];
    [_navBarView createRightBtnTitle:rightTitle titleColor:NavBarRightTitleCoror];
}

- (void)navTitle:(NSString *)title backType:(BackType)backType rightTitle:(NSString *)rightTitle rightTitleColor:(UIColor *)rightTitleColor
{
    [self navTitle:title backType:backType];
    [_navBarView createRightBtnTitle:rightTitle titleColor:rightTitleColor];
}

//backType返回按钮 & 中间文字 & 右按钮图片
- (void)navTitle:(NSString *)title backType:(BackType)backType rightImgName:(NSString *)rightImgName
{
    [self navTitle:title backType:backType];
    [_navBarView createRightBtnWithImgStr:rightImgName];
}

//创建右侧文字按钮
-(void)createRightBt:(NSString *)rightTitle titleColor:(UIColor *)titleColor
{
    [_navBarView createRightBtnTitle:rightTitle titleColor:titleColor];
}
-(void)createRightBtWithImg:(NSString *)imgName
{
    [_navBarView createRightBtnWithImgStr:imgName];
}

//创建状态栏背景view
-(void)createStatusViewWithBgColor:(UIColor *)BgColor
{
    self.stateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, StatusBarH)];
    self.stateView.backgroundColor = BgColor;
    [self.view addSubview:self.stateView];
    
}

//配置蓝色导航栏
-(void)configNavBarWithNavBgColor:(UIColor *)navBgColor navTitleColor:(UIColor *)navTitleColor
{
    _navBarView.backgroundColor = navBgColor;
    _navBarView.titler.textColor = navTitleColor;
}

//状态栏背景view
-(void)configStatusViewWithBgColor:(UIColor *)BgColor
{
    if (!_stateView) {
        [self createStatusViewWithBgColor:BgColor];
    }
    self.stateView.backgroundColor = BgColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end




















