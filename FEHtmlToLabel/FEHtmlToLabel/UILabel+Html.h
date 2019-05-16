//
//  UILabel+Html.h
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/16.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (Html)

- (void)loadHtmlWithStyle:(NSString *)string;

- (void)loadHtmlWithSpan:(NSString *)string;

@end

