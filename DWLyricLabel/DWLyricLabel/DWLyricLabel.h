//
//  DWLyricLabel.h
//  textLayer
//
//  Created by Wicky on 16/10/4.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWLyricLabel : UIView
@property (nonatomic ,assign) NSInteger location;
@property (nonatomic) UIColor * trackTintColor;
-(instancetype)initWithString:(NSString *)lyric
                         font:(UIFont *)font
                   widthLimit:(CGFloat)widthLimit
                  heightLimit:(CGFloat)heightLimit;
-(void)updateWithDuration:(CGFloat)duartion;
-(void)updateLocation:(NSInteger)location
             duration:(CGFloat)duration;
-(void)updateProgress:(CGFloat)progress
             duration:(CGFloat)duration;
@end

