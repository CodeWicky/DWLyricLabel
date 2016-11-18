//
//  NSString+DWStringTool.m
//  textLayer
//
//  Created by Wicky on 16/10/4.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "NSString+DWStringTool.h"

@implementation NSString (DWStringTool)
-(CGSize)stringSizeWithFont:(UIFont *)font widthLimit:(CGFloat)widthLimit heightLimit:(CGFloat)heightLimit
{
    return  [self boundingRectWithSize:CGSizeMake(widthLimit, heightLimit) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}
@end
