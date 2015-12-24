//
//  ViewController.m
//  sliderToUnlock
//
//  Created by admin on 15/12/23.
//  Copyright © 2015年 luofu. All rights reserved.
//

#import "ViewController.h"
#import "LfSliderUnlockView.h"
@interface ViewController ()

@end

@implementation ViewController
LfSliderUnlockView * lfsliderViewController ;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    lfsliderViewController = [[LfSliderUnlockView alloc] initWithSliderText:@"> Slider To Unlock" infoText:@"It's Time" backgroundImageName:@"background"];
    [self addChildViewController:lfsliderViewController];
    [self.view addSubview:lfsliderViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickShowSliderView:(id)sender {
    lfsliderViewController = [[LfSliderUnlockView alloc] initWithSliderText:@"> Slider To Unlock" infoText:@"It's Time" backgroundImageName:@"background"];
    [self addChildViewController:lfsliderViewController];
    [self.view addSubview:lfsliderViewController.view];
}

@end
