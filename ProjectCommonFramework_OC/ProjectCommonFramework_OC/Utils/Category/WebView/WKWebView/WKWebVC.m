//
//  WKWebVC.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/16.
//  Copyright © 2018 秦国华. All rights reserved.
//

#import "WKWebVC.h"
#import <WebKit/WebKit.h>
@interface WKWebVC ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webView;
//加载进度条
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic,strong) NSURL *url;
//连连支付回调url
@property (nonatomic,copy) NSString *callbackUrlStr;

//微信支付的支付链接（需加请求头）
@property (nonatomic,copy) NSString *payDomian;

@end

@implementation WKWebVC

-(instancetype)init
{
    return [self initWithTitle:nil url:nil returnType:BackType_PopVC];
}

- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url {
    
    return [self initWithTitle:title url:url returnType:BackType_PopVC];
}

- (instancetype)initWithTitle:(NSString*)title url:(NSURL*)url returnType:(BackType)returnType {
    self = [super init];
    if (self) {
//        [self navTitle:title backType:returnType];
        _titler = title;
        [self setupViews];
        // 加载内容
        NSURLRequest *requset = [[NSURLRequest alloc]initWithURL:_url];
        [self.webView loadRequest:requset];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QGHWhiteCor;
}

-(void)setupViews
{
    [self createNavBar];
    [self createProgressView];
    [self commonInitWeb];
}

-(void)createNavBar
{
    
//    [self navTitle:_titler backType:self.backType];
}

-(void)createProgressView
{
    //进度条初始化
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0,NavBarTop, ScreenW, 1.0)];
    self.progressView.backgroundColor = QGHWhiteCor;
    // 设置进度条的色彩
    [self.progressView setTrackTintColor:QGHWhiteCor];
    self.progressView.progressTintColor = QGHBlueColor;
    //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 0.5f);
    [self.view addSubview:self.progressView];
}
- (void)commonInitWeb {
    
    // 配置参数
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    
    // 设置偏好设置
    config.preferences = [[WKPreferences alloc]init];
    
    // 默认为0
    config.preferences.minimumFontSize = 10;
    
    // 默认认为YES
    config.preferences.javaScriptEnabled = YES;
    
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
    
    // web内容处理池，由于没有属性可以设置，也没有方法可以调用，不用手动创建
    config.processPool = [[WKProcessPool alloc]init];
    
    // 通过JS与webview内容交互
    config.userContentController = [[WKUserContentController alloc] init];
    
    // 注入JS对象名称AppModel，当JS通过AppModel来调用时，
    // 我们可以在WKScriptMessageHandler代理中接收到
    // couponCallBack，orderIdCallBack，couponsJumpToPayDone 是与前端约定好的方法名称
    //    [config.userContentController addScriptMessageHandler:self name:@"couponCallBack"];
    //    [config.userContentController addScriptMessageHandler:self name:@"orderIdCallBack"];
    //    [config.userContentController addScriptMessageHandler:self name:@"couponsJumpToPayDone"];
    //
    WKWebView *webView                                = [[WKWebView alloc] initWithFrame:CGRectMake(0, NavBarTop, ScreenW, ScreenH-NavBarTop) configuration:config];
    webView.backgroundColor                           = [UIColor clearColor];
    webView.opaque                                    = YES;
    webView.scrollView.showsVerticalScrollIndicator   = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.navigationDelegate                        = self;
    webView.UIDelegate                                = self;
    self.webView                                      = webView;
    [self.view addSubview:webView];
    
    //添加KVO，WKWebView有一个属性estimatedProgress，就是当前网页加载的进度，所以监听这个属性。
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
#pragma mark - **************** action
-(void)leftAction
{
    if (_useGoBack && self.webView.canGoBack==YES) {
        [self.webView goBack];
        return;
    }

}

//重新设置title 和 url
- (void)webWithTitle:(NSString*)title url:(NSURL*)url
{
    [self updateTitle:title];
    self.url = url;
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}
//重新设置title 和 url 、返回方式
- (void)webWithTitle:(NSString*)title url:(NSURL*)url backType:(BackType)backType
{
    [self webWithTitle:title url:url];
    [self configBackType:backType];
}
//更新title
-(void)updateTitle:(NSString *)title
{
//    self.header.titler.text=title;
}

- (void)configBackType:(BackType)backType {
//    self.backType = backType;
}

//在监听方法中获取网页加载的进度，并将进度赋给progressView.progress
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)webLoadStart
{
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
    
}

-(void)webLoadStop
{
    self.progressView.hidden = YES;
}

#pragma mark - utils
//协议拦截
- (void)skipWithStr:(NSString *)str {
    
}

#pragma mark - WKNavigationDelegate
/*
 * 在发送请求之前，决定是否跳转
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSString *urlString = [navigationAction.request.URL.absoluteString stringByRemovingPercentEncoding];
    //协议拦截
    if ([urlString containsString:@""]) {
        [self skipWithStr:urlString];
        decisionHandler(WKNavigationActionPolicyCancel);
    }else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
}

/*
 * 页面加载完成之后调用
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"页面加载完成");
    [self webLoadStop];
}

/*
 * 页面加载失败时调用
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"页面加载失败");
    [self webLoadStop];
}

/*
 * 开始导航跳转时会回调
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [self webLoadStart];
}

/*
 * 当内容开始返回时调用
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

/*
 * 执行JS代码时会调用
 */
- (void)evaluateJavaScript:(NSString *)javaScriptString
         completionHandler:(void (^)(id, NSError *))completionHandler {
}

/*
 * H5->App 传值
 * 注入JS对象名称AppModel，当JS通过AppModel来调用时，
 * 在WKScriptMessageHandler代理中接收到
 */
//- (void)userContentController:(WKUserContentController *)userContentController
//      didReceiveScriptMessage:(WKScriptMessage *)message
//{
//
//    NSString *messageName = message.name;
//    id messageBody        = message.body;
//
//    // 可在以下对应语句中做逻辑处理，例如跳转到对应的界面
//    if ([messageName isEqualToString:@"couponCallBack"]) {
//
//    }else if ([messageName isEqualToString:@"orderIdCallBack"]) {
//
//    }else if ([messageName isEqualToString:@"couponsJumpToPayDone"]) {
//
//    }
//}

#pragma mark - WKUIDelegate

/**
 *  @author ChenCheng
 *
 *  web界面有弹出框时调用
 *
 *  @param webView           实现该代理的webview
 *  @param message           弹出框的内容
 *  @param frame             主窗口
 *  @param completionHandler 弹出框消失调用
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            completionHandler();
        }
    }];
    
    UIAlertController *alertController = [[UIAlertController alloc] init];
    [alertController addAction:action];
}

/**
 *  web界面中有弹出警告框时调用
 *
 *  @param webView           实现该代理的webview
 *  @param message           警告框中的内容
 *  @param frame             主窗口
 *  @param completionHandler 警告框消失调用
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            completionHandler(NO);
        }
    }];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action) {
            completionHandler(YES);
        }
    }];
    
    UIAlertController *alertController = [[UIAlertController alloc] init];
    [alertController addAction:cancelAction];
    [alertController addAction:action];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString *))completionHandler {
}

- (void)dealloc {
    NSLog(@"webview dealloc");
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
