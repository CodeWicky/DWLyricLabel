//
//  NSString+DWStringTool.h
//  textLayer
//
//  Created by Wicky on 16/10/4.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (DWStringTool)
-(CGSize)stringSizeWithFont:(UIFont *)font
                 widthLimit:(CGFloat)widthLimit
                heightLimit:(CGFloat)heightLimit;
@end
