//
//  ViewController.m
//  DWLyricLabel
//
//  Created by Wicky on 16/11/19.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "ViewController.h"
#import "DWLyricLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    DWLyricLabel * lyricLB = [[DWLyricLabel alloc] initWithString:@"只怪你入戏太深" font:[UIFont fontWithName:@"PingFangSC-Semibold" size:40] widthLimit:0 heightLimit:100];
    lyricLB.backgroundColor = [UIColor yellowColor];
    lyricLB.tintColor = [UIColor redColor];
    lyricLB.trackTintColor = [UIColor greenColor];
    lyricLB.center = self.view.center;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [lyricLB updateLocation:6 duration:3];
    });
    
    [self.view addSubview:lyricLB];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
