//
//  ViewController.m
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/16.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Html.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label1;

@property (strong, nonatomic) UILabel *label2;

@property (strong, nonatomic) UILabel *label3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadHtmlLabel1];
    [self loadHtmlLabel2];
    [self loadHtmlLabel3];
}

-(void)loadHtmlLabel1 {
    NSString *htmlStr = @"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>";
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    NSData *data = [htmlStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    self.label1.attributedText = attStr;
    [self.view addSubview:self.label1];
}

-(void)loadHtmlLabel2 {
    NSString *htmlStr = @"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>";
    [self.label2 loadHtmlWithStyle:htmlStr];
    [self.view addSubview:self.label2];
}

-(void)loadHtmlLabel3 {
    NSString *htmlStr = @"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>";
    [self.label3 loadHtmlWithSpan:htmlStr];
     [self.view addSubview:self.label3];
}

# pragma mark Accessors

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 100)];
        _label1.textColor = [UIColor blackColor];
        _label1.backgroundColor = [UIColor whiteColor];
        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.numberOfLines = 0;
        // 直接设置字体无效
        _label1.font = [UIFont fontWithName:@"PingFangSC" size:20];
    }
    return _label1;
}


- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 300, 100)];
        _label2.textColor = [UIColor blackColor];
        _label2.backgroundColor = [UIColor whiteColor];
        _label2.textAlignment = NSTextAlignmentCenter;
        _label2.numberOfLines = 0;
        //怎么设置字号都没有效果
        _label2.font = [UIFont fontWithName:@"PingFangSC" size:20];
    }
    return _label2;
}

- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, 300, 100)];
        _label3.textColor = [UIColor blackColor];
        _label3.backgroundColor = [UIColor whiteColor];
        _label3.textAlignment = NSTextAlignmentCenter;
        _label3.numberOfLines = 0;
        //怎么设置字号都没有效果
        _label3.font = [UIFont fontWithName:@"PingFangSC" size:20];
    }
    return _label3;
}


@end
