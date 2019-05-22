//
//  WebViewController.m
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/22.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

NSString * const WebContentPrefix = @"<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><style>img {max-width:100%;height:auto;} html { font-size: 18px}</style></head>";

@interface WebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (NSString *)webContent:(NSString *)str {
    NSString *content = [NSString stringWithFormat:@"%@%@",WebContentPrefix,str];
    return content;
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    CGFloat contentHeight = self.webView.scrollView.contentSize.height;
    [self.webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable height, NSError * _Nullable error) {
        NSLog(@"内容加载完成高度---%@",height);
    }];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentSize"]) {
        CGFloat contentHeight = self.webView.scrollView.contentSize.height;
        NSLog(@"当前计算的高度:%f",contentHeight);
    }
}

#pragma mark Accessors

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, 414, 40)];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

#pragma mark Setup

- (void)setup {
    self.view.backgroundColor = [UIColor whiteColor];
//    NSString *content = @"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>";
//    NSString *content = @"<p>恋恋不舍</p>";
    NSString *content = @"恋恋不舍";
    NSString *htmlString = [self webContent:content];
    [self.webView loadHTMLString:htmlString baseURL:nil];
//    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    self.webView.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.webView];
}

@end
