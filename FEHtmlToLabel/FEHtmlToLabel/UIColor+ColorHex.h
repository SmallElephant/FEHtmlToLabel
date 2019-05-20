//
//  UIColor+ColorHex.h
//  FEHtmlToLabel
//
//  Created by FlyElephant on 2019/5/17.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorHex)

+ (UIColor *)colorWithHexString:(NSString *)hexStr;

+ (UIColor *)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

@end
