//
//  WebViewController.m
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/22.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

NSString * const WebContentPrefix = @"<html><body><head><style>body { font-size: 30px}</style></head></body></html>";

@interface WebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@property (copy, nonatomic) NSString *htmlString;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (NSString *)webContent:(NSString *)str {
    NSString *HTML_HEAD = @"<!DOCTYPE HTML><html><head><title>test</title><meta charset='utf-8'/><meta name='viewport' content='width=device-width, initial-scale=1'/><style>body{margin:0px;border:0px,padding:0px}</style></head><body>";
    NSString *HTML_FOOT = @"</body></html>";
//    UIFont *font = [UIFont fontWithName:@"PingFangSC" size:18];
    UIFont *font = [UIFont systemFontOfSize:18];
    NSString  *mid = [NSString stringWithFormat:@"<span style=\"font-family: '%@'; font-size: %fpx;color:%@\">%@</span>", font.fontName, font.pointSize, @"#3565EA",str];
    NSString *content = [NSString stringWithFormat:@"%@%@%@",HTML_HEAD,mid,HTML_FOOT];
    return content;
}

- (NSString *)webContent2:(NSString *)str {
    UIFont *font = [UIFont systemFontOfSize:18];
    NSString  *mid = [NSString stringWithFormat:@"<div style=\"font-family: '%@'; font-size: %fpx;color:%@\">%@</div>", font.fontName, font.pointSize, @"#3565EA",str];
    return mid;
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    CGFloat contentHeight = self.webView.scrollView.contentSize.height;
//    [self.webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable height, NSError * _Nullable error) {
//        NSLog(@"内容加载完成高度---%@",height);
//    }];
    
 
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentSize"]) {
        CGFloat contentHeight = self.webView.scrollView.contentSize.height;
        NSLog(@"WebView内容:%@---当前计算的高度:%f",self.htmlString,contentHeight);
    }
}

#pragma mark Accessors

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, 414, 31)];
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
//    NSString *content = @"恋恋不舍";
//     NSString *content = @" <p><strong>喘</strong>息(chuǎn)&nbsp;&nbsp; <strong>凝</strong>重(n&iacute;ng)&nbsp; &nbsp; &nbsp;勉<strong>强</strong>(qi&aacute;ng)&nbsp;&nbsp; <strong>倾</strong>盆大雨(qīng)</p>";
//    NSString *content = @"天上的星星调皮地冲我眨着眼睛。";
//    NSString *content = @"<p><strong>喘</strong>息(chuǎn)&nbsp;&nbsp; <strong>凝</strong>重(n&iacute;ng)&nbsp; &nbsp; &nbsp;勉<strong>强</strong>(qi&aacute;ng)&nbsp;&nbsp; <strong>倾</strong>盆大雨(qīng)</p>";
//    NSString *content = @"<p>震撼人心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 浓妆艳抹</p>";
//    NSString *content = @"<p><strong>沮</strong>丧(jǔ)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong>逊</strong>色(x&ugrave;n)&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong>薄</strong>弱(b&oacute;)&nbsp; &nbsp; &nbsp; &nbsp;<strong>饮</strong>马溪边(yǐn)</p>";
    NSString *content = @"<p><strong>呕</strong>吐(ǒu)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>转</strong>椅(zhuǎn)&nbsp; &nbsp; 日<strong>晕</strong>(y&ugrave;n)&nbsp; &nbsp; &nbsp;目<strong>瞪</strong>口呆(d&egrave;ng)</p>";
    NSString *htmlString = [self webContent:content];
    self.htmlString = content;
    [self.webView loadHTMLString:htmlString baseURL:nil];
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    self.webView.scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.webView];
}

@end
