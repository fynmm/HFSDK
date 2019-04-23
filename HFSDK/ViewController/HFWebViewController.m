//
//  HFWebViewController.m
//  HFSDK
//
//  Created by HeartlessSoy on 2019/4/18.
//  Copyright © 2019 HeartlessSoy. All rights reserved.
//

#import "HFWebViewController.h"
#import "WebKit/WebKit.h"
#import "UIView+HFScreen.h"

@interface HFWebViewController ()<WKNavigationDelegate>
@property (nonatomic,strong)WKWebView *web;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIProgressView *progressView;

@property (nonatomic,strong)NSURL *temp;


@end

@implementation HFWebViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.web = [[WKWebView alloc] initWithFrame:CGRectZero];
    self.topView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.web];
    [self.view addSubview:self.topView];
    self.web.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    self.topView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    
    
    self.web.navigationDelegate = self;
    [self.view showLoadingWithText:nil];
    
    
    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    //    _progressView = [[UIProgressView alloc]init];
    //    [self.view addSubview:_progressView];
    //    _progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 2);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];

    [self.topView addGestureRecognizer:tap];

    
    
}
- (void)click {
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@",self.appId];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url] ];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dealloc {
    [self.web removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
    
    
}


//WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //    LxDBAnyVar("WKWEBVIEW 加载成功");
    [self.view hiddenHud];
  
    
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self.view hiddenHud];
    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view showLoadingWithText:nil];
}
@end
