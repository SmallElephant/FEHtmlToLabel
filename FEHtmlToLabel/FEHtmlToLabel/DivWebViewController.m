//
//  DivWebViewController.m
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/22.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "DivWebViewController.h"

@interface DivWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation DivWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    CGFloat webViewHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];//高度
    NSLog(@"scollHeight高度:%f",webViewHeight);
}

- (NSString *)webContent:(NSString *)str {
    NSString *HTML_HEAD = @"<!DOCTYPE HTML><html><head><title>test</title><meta charset='utf-8'/><meta name='viewport' content='width=device-width, initial-scale=1'/><style>body{margin:0px;border:0px}</style></head><body>";
    NSString *HTML_FOOT = @"</body></html>";
    UIFont *font = [UIFont systemFontOfSize:18];
    NSString  *mid = [NSString stringWithFormat:@"<span style=\"font-family: '%@'; font-size: %f;color:%@\">%@</span>", font.fontName, font.pointSize, @"#3565EA",str];
    NSString *content = [NSString stringWithFormat:@"%@%@%@",HTML_HEAD,mid,HTML_FOOT];
    return content;
}

- (void)setup {
    self.view.backgroundColor = [UIColor whiteColor];
    _webView = [[UIWebView alloc] initWithFrame: CGRectMake(0, 0, 414, 40)];
    _webView.delegate = self;
//    _webView.scrollView.bounces = NO;
//    _webView.scrollView.showsHorizontalScrollIndicator = NO;
//    _webView.scrollView.scrollEnabled = NO;
    [_webView sizeToFit];
     NSString *content = @"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>";

    NSString * htmlcontent = [self webContent:content];
    [_webView loadHTMLString:htmlcontent baseURL:nil];
    [self.view addSubview:self.webView];
}


@end
