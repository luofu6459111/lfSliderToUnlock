//
//  LfSliderUnlockView.h
//  sliderToUnlock
//
//  Created by admin on 15/12/23.
//  Copyright © 2015年 luofu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LfSliderUnlockView : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) CABasicAnimation *gradient;
@property (strong, nonatomic) NSTimer *timer;

- (id)initWithSliderText : (NSString *) sliderText infoText : (NSString *)infoText backgroundImageName : (NSString *) imageName ;
@end
