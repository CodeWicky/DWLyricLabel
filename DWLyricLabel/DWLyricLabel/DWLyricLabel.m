//
//  DWLyricLabel.m
//  textLayer
//
//  Created by Wicky on 16/10/4.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "DWLyricLabel.h"
#import "NSString+DWStringTool.h"

@interface DWLyricLabel ()

@property (nonatomic) CALayer * trackLayer;

@property (nonatomic) CAShapeLayer * backLayer;

@property (nonatomic) CATextLayer * textLayer;

@property (nonatomic ,copy) NSString * lyric;

@property (nonatomic) UIFont * font;

@property (nonatomic ,assign) CGFloat progress;

@end

@implementation DWLyricLabel

-(instancetype)initWithString:(NSString *)lyric
                         font:(UIFont *)font
                   widthLimit:(CGFloat)widthLimit
                  heightLimit:(CGFloat)heightLimit
{
    CGSize size = [lyric stringSizeWithFont:font widthLimit:widthLimit heightLimit:heightLimit];
    CGRect frame = CGRectZero;
    frame.size = size;
    self = [super initWithFrame:frame];
    if (self) {
        _location = -1;
        _lyric = lyric;
        _font = font;
        [self setMyLayers];
    }
    return self;
}

-(void)updateWithDuration:(CGFloat)duartion
{
    if ((int)self.location < (int)(self.lyric.length - 1)) {
        [self updateLocation:self.location + 1 duration:duartion];
    }
}

-(void)updateLocation:(NSInteger)location duration:(CGFloat)duration
{
    self.location = location;
    CGFloat progress = (location + 1) * 1.0 / self.lyric.length;
    [self updateProgress:progress duration:duration];
}

-(void)updateProgress:(CGFloat)progress duration:(CGFloat)duration
{
    self.progress = progress;
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    self.backLayer.strokeEnd = progress;
    [CATransaction commit];
}

-(void)setMyLayers
{
    [self createTrackLayer];
    [self createTheBackLayer];
    [self createTheTextLayer];
}

-(void)createTrackLayer
{
    self.trackLayer = [CALayer layer];
    self.trackLayer.bounds = self.bounds;
    self.trackLayer.position = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    self.trackLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:self.trackLayer];
}

-(void)createTheBackLayer
{
    self.backLayer = [CAShapeLayer layer];
    self.backLayer.bounds = self.bounds;
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height / 2.0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height / 2.0)];
    self.backLayer.path = path.CGPath;
    self.backLayer.position = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    self.backLayer.lineWidth = self.bounds.size.height;
    self.backLayer.strokeColor = [UIColor blackColor].CGColor;
    self.backLayer.strokeEnd = 0;
    [self.trackLayer addSublayer:self.backLayer];
}

-(void)createTheTextLayer
{
    self.textLayer = [CATextLayer layer];
    self.textLayer.bounds = self.bounds;
    self.textLayer.position = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    self.textLayer.string = self.lyric;
    self.textLayer.foregroundColor = [UIColor blackColor].CGColor;
    self.textLayer.wrapped = YES;
    self.textLayer.truncationMode = @"end";
    self.textLayer.font = CFBridgingRetain(self.font.fontName);
    self.textLayer.fontSize = self.font.pointSize;
    self.trackLayer.mask = self.textLayer;
}

-(void)setTintColor:(UIColor *)tintColor
{
    self.backLayer.strokeColor = tintColor.CGColor;
}

-(UIColor *)tintColor
{
    return [UIColor colorWithCGColor:self.backLayer.strokeColor];
}

-(void)setTrackTintColor:(UIColor *)trackTintColor
{
    _trackTintColor = trackTintColor;
    self.trackLayer.backgroundColor = trackTintColor.CGColor;
}

@end
