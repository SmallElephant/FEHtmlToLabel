//
//  UILabel+Html.m
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/16.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import "UILabel+Html.h"

@implementation UILabel (Html)

- (void)loadHtmlWithStyle:(NSString *)string {
    string = [string stringByAppendingString:[NSString stringWithFormat:@"<style>body{font-family: '%@'; font-size:%fpx;color: %@}</style>",
                                              self.font.fontName,
                                              self.font.pointSize, @"#3565EA"]];
    self.attributedText = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding]
                                                           options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                     NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                documentAttributes:nil
                                                             error:nil];
}

- (void)loadHtmlWithSpan:(NSString *)string {
    string = [NSString stringWithFormat:@"<span style=\"font-family: '%@'; font-size: %f;color:%@\">%@</span>", self.font.fontName, self.font.pointSize, @"#3565EA",string];
    self.attributedText = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding]
                                                           options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                     NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                documentAttributes:nil
                                                             error:nil];
}

@end
