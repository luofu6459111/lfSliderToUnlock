//
//  LfSliderUnlockView.m
//  sliderToUnlock
//
//  Created by admin on 15/12/23.
//  Copyright © 2015年 luofu. All rights reserved.
//

#import "LfSliderUnlockView.h"

@interface LfSliderUnlockView ()
{
    
    UIView *_sliderview;
    UIScrollView * _scrollView;
    NSString *  _imageName;
    NSString * _sliderText;
    NSString * _infoText;
}

@end

@implementation LfSliderUnlockView
- (id)initWithSliderText:(NSString *)sliderText infoText:(NSString *)infoText backgroundImageName:(NSString *)imageName{
    if (self = [super init]) {
        _imageName  = imageName;
        _sliderText = sliderText;
        _infoText = infoText;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //make sure full screen
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view.bounds = bounds;
    
    //setting background
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageName]];
    imageView.center = self.view.center;
    imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView];
    
    //setting scroll view
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(2 * CGRectGetWidth(_scrollView.frame), 0);
    _scrollView.pagingEnabled = YES;
    
    [self.view addSubview:_scrollView];
    [self drawSliderView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - drawing slider
- (void) drawSliderView{
    //init sliderview sliderView Include
    _sliderview = [[UIView alloc] init];
    _sliderview.frame = CGRectMake(self.view.bounds.size.width,self.view.bounds.size.height/1.3, self.view.bounds.size.width, 100);
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _sliderview.frame.size.width, _sliderview.frame.size.height)];
    [_sliderview addSubview:textLabel];
    [_scrollView addSubview:_sliderview];
    
    //setting info
    
    UILabel *textInfoLabel = [[UILabel alloc] init];
    textInfoLabel.text = _infoText;
    textInfoLabel.textAlignment = NSTextAlignmentCenter;
    textInfoLabel.textColor = [UIColor whiteColor];
     textInfoLabel.font = [UIFont fontWithName:@"Helvetica" size:30];
    CGSize size = [textInfoLabel sizeThatFits:CGSizeMake(textInfoLabel.frame.size.width, MAXFLOAT)];
    textInfoLabel.frame = CGRectMake((self.view.frame.size.width*3-size.width)/2,self.view.frame.size.height/6, size.width, size.height);
    [_scrollView addSubview:textInfoLabel];
    //setting gradient layer
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = _sliderview.bounds;
    [_sliderview.layer addSublayer:self.gradientLayer];
    
    //setting gradient direction
    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
    self.gradientLayer.endPoint = CGPointMake(1, 0.5 );
    
    //setting color ,you can set more than three color.
    self.gradientLayer.colors = @[(__bridge id)[UIColor grayColor].CGColor,
                                  (__bridge id)[UIColor whiteColor].CGColor,
                                  (__bridge id)[UIColor grayColor].CGColor];
    
    //setting the percent of each color
    
    self.gradientLayer.locations = @[@(0.2f) ,@(0.5f),@(0.8f)];
    //settring animation
    self.gradient = [CABasicAnimation animationWithKeyPath:@"locations"];
    self.gradient.fromValue = @[@(0.0f),@(0.0f),@(0.25f)];
    self.gradient.toValue = @[@(0.75f),@(1.0f),@(1.0f)];
    self.gradient.duration = 2;
    self.gradient.repeatCount = HUGE;
    [self.gradientLayer addAnimation:self.gradient forKey:nil];
    
    //add the slider test
    
    textLabel.text =_sliderText;
    textLabel.font = [UIFont systemFontOfSize:25];
    textLabel.textAlignment = NSTextAlignmentCenter;
    self.gradientLayer.mask = textLabel.layer;
    
    [_scrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:NO];
    
}
#pragma mark - view control function

- (void)gotoFollowCountDownView{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.view.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
                    
                     }];
    
}
#pragma mark - slider delegate function
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint positon = scrollView.contentOffset;
    
    if (positon.x==0) {
        [self gotoFollowCountDownView];
    }
}
@end
