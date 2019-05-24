//
//  LabelViewController.m
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/22.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "LabelViewController.h"
#import "UILabel+Html.h"
#import "UIColor+ColorHex.h"

@interface LabelViewController ()

@property (strong, nonatomic) UILabel *label1;

@property (strong, nonatomic) UILabel *label2;

@property (strong, nonatomic) UILabel *label3;

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        [self loadHtmlLabel1];
    //    [self loadHtmlLabel2];
    //    [self loadHtmlLabel3];
    //    [self testheight];
    //    [self isHtmlString:@"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>"];
    //
    //    NSString *res = [self stringByStrippingHTML:@"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>"];
    //    NSLog(@"最终的结果:%@",res);
    self.view.backgroundColor = [UIColor whiteColor];
//    [self loadWebView];
}

- (void)loadWebView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 30, 400, 100)];
    NSString *htmlString = @"<html><head></head><body><p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p></body></html>";
    [webView loadHTMLString:htmlString baseURL: nil];
    [self.view addSubview:webView];
}

- (void)isHtmlString:(NSString *)text {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<(.|\n)*?>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    for (NSTextCheckingResult *match in matches) {
        //NSRange matchRange = [match range]; //获取所匹配的最长字符串
        for (int i = 0; i < match.numberOfRanges; i++) {
            NSRange matchRange = [match rangeAtIndex:i];
            NSString *matchString = [text substringWithRange:matchRange];
            NSLog(@"index:%@, %@", @(i), matchString);
        }
    }
}

-(void)loadHtmlLabel1 {
    //    NSString *htmlStr = @"<p>回到故乡，见到亲人，在外漂泊多年的他终于<strong>忍俊不禁</strong>，留下了心酸的泪水。</p>";
    //    NSString *htmlStr = @"<p>酿</strong>造（ni&agrave;ng） 苍<strong>劲</strong>（j&igrave;ng） <strong>歼</strong>灭（qiān） 枯<strong>涸</strong>（h&eacute;）</p>";
//    NSString *htmlStr = @"洗漱穿戴&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 谈笑风生";
//    NSString *htmlStr = @"<p>①恋恋不<strong>舍</strong>（舍弃） &nbsp;&nbsp;②<strong>鸿雁</strong>（书信）传书&nbsp; &nbsp; &nbsp; ③万<strong>籁</strong>（声响）俱寂</p>";
//    NSString *htmlStr = @"<p>回到故乡</p>";
       NSString *htmlStr = @" <p><strong>喘</strong>息(chuǎn)&nbsp;&nbsp; <strong>凝</strong>重(n&iacute;ng)&nbsp; &nbsp; &nbsp;勉<strong>强</strong>(qi&aacute;ng)&nbsp;&nbsp; <strong>倾</strong>盆大雨(qīng)</p>";
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    NSData *data = [htmlStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    UILabel *attLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, 400, 10)];
    attLabel.numberOfLines = 0;
    attLabel.backgroundColor = [UIColor redColor];
    NSRange attRange = NSMakeRange(0, attStr.length);
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:attRange];
    attLabel.attributedText = attStr;
    
    CGSize attSize1 = [attLabel sizeThatFits:CGSizeMake(414, MAXFLOAT)];
    NSLog(@"attstring1标签的高度:%f",attSize1.height);
    
    CGSize attSize2 =  [attStr boundingRectWithSize:CGSizeMake(414, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    NSLog(@"attstring2标签的高度:%f",attSize2.height);
    [self.view addSubview:attLabel];
//    [self.label1 loadHtmlWithStyle:htmlStr];
    [self.label1 loadHtmlWithSpan:htmlStr];
    CGSize labelSize = [self.label1 sizeThatFits:CGSizeMake(414, MAXFLOAT)];
    NSLog(@"UILabel的内容:%@----标签的高度:%f",htmlStr,labelSize.height);
    [self.view addSubview:self.label1];
}

-(NSString *)stringByStrippingHTML:(NSString *)str {
    NSRange r;
    NSString *s = [str copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
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

- (void)testheight {
    CGFloat height1 = [self calutorHeight:@"是否具有良好的心理素质，是考试取得好成绩的条件之一。"];
    CGFloat height2 = [self calutorHeight:@"为了防止不再出现这样的问题，我们制定了具体的改进措施。"];
    CGFloat height3 = [self calutorHeight:@"各地中小学完善和建立了校园安全预防工作机制。"];
    NSLog(@"高度1---%f--高度2---%f---高度3---%f",height1,height2,height3);
    
    UILabel *label = [self sizeLabel:@"是否具有良好的心理素质，是考试取得好成绩的条件之一。"];
    [self.view addSubview:label];
    
    UILabel *label2= [self sizeLabel:@"为了防止不再出现这样的问题，我们制定了具体的改进措施。"];
    //    [self.view addSubview:label];
    
    UILabel *label3 = [self sizeLabel:@"各地中小学完善和建立了校园安全预防工作机制。"];
    
    // 20个字
    CGFloat height4 = [self requiredHeight:@"是否具有良好的心理素质是考试取得好成绩的"];
    // 22个字
    CGFloat height5 = [self requiredHeight:@"是否具有良好的心理素质是考试取得好成绩的条件"];
    // 23个字
    CGFloat height6 = [self requiredHeight:@"是否具有良好的心理素质是考试取得好成绩的条件之一"];
    // 24个字
    CGFloat height7 = [self requiredHeight:@"是否具有良好的心理素质是考试取得好成绩的条件之一"];
    NSLog(@"高度4---%f--高度5---%f---高度6---%f--高度7---%f",height4,height5,height6,height7);
}



- (UILabel *)sizeLabel:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 520, 410, 50)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.textAlignment = NSTextAlignmentLeft;
    //    label.text = @"各地中小学完善和建立了校园安全预防工作机制。";
    label.text = text;
    label.font = [UIFont systemFontOfSize:18];
    label.backgroundColor = [UIColor redColor];
    CGSize labelSize = [label sizeThatFits:CGSizeMake(MAXFLOAT, 23)];
    CGFloat height4 = ceil(labelSize.height) + 1;
    NSLog(@"高度3--%f",height4);
    NSLog(@"text:%@---size:%@",text,NSStringFromCGSize(labelSize));
    return label;
}

- (CGFloat)requiredHeight:(NSString*)labelText {
    
    UIFont *font = [UIFont systemFontOfSize:18];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 415, CGFLOAT_MAX)];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = font;
    label.text = labelText;
    CGSize labelSize = [label sizeThatFits:CGSizeMake(415, CGFLOAT_MAX)];
    NSLog(@"label size:%@",NSStringFromCGSize(labelSize));
    return labelSize.height;
}

- (CGFloat)calutorHeight:(NSString *)text {
    
    // 段落设置与实际显示的 Label 属性一致 采用 NSMutableParagraphStyle 设置Nib 中 Label 的相关属性传入到 NSAttributeString 中计算；
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSParagraphStyleAttributeName:style}];
    
    CGSize size =  [string boundingRectWithSize:CGSizeMake(415, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    NSLog(@" size =  %@", NSStringFromCGSize(size));
    
    // 并不是高度计算不对，我估计是计算出来的数据是 小数，在应用到布局的时候稍微差一点点就不能保证按照计算时那样排列，所以为了确保布局按照我们计算的数据来，就在原来计算的基础上 取ceil值，再加1；
    CGFloat height = ceil(size.height) + 1;
    return height;
}

# pragma mark Accessors

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 414, 83)];
        _label1.textColor = [UIColor blackColor];
        _label1.backgroundColor = [UIColor redColor];
        //        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.numberOfLines = 0;
        // 直接设置字体无效
        _label1.font = [UIFont fontWithName:@"PingFangSC" size:12];
    }
    return _label1;
}


- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 300, 100)];
        _label2.textColor = [UIColor colorWithHexString:@"3565EA"];
        _label2.backgroundColor = [UIColor whiteColor];
        _label2.textAlignment = NSTextAlignmentCenter;
        _label2.numberOfLines = 0;
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
        _label3.font = [UIFont fontWithName:@"PingFangSC" size:20];
    }
    return _label3;
}


@end

