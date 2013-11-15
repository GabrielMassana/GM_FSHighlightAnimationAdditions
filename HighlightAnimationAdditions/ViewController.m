//
//  ViewController.m
//  HighlightAnimationAdditions
//
//  Created by Gabriel Massana on 11/15/13.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"
#import "GM_FSHighlightAnimationAdditions.h"

#define LABEL_ONE_TEXT @"Left To Right"
#define LABEL_TWO_TEXT @"Right To Left"

@interface ViewController ()

@property (nonatomic, strong) UILabel *labelOne;
@property (nonatomic, strong) UILabel *labelTwo;
@property (nonatomic, strong) UIButton *startAnimationsButton;
@property (nonatomic, strong) UIButton *stopAnimationsButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.labelOne = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 280, 30)];
    [self.labelOne setText:LABEL_ONE_TEXT];
    [self.labelOne setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25]];
    [self.labelOne setAdjustsFontSizeToFitWidth:YES];
    [self.labelOne setMinimumScaleFactor:15/25];
    [self.labelOne setTextAlignment:NSTextAlignmentCenter];
    [self.labelOne setTextColor:[UIColor blackColor]];
    [self.labelOne setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.labelOne];
    
    self.labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 30)];
    [self.labelTwo setText:LABEL_TWO_TEXT];
    [self.labelTwo setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25]];
    [self.labelTwo setAdjustsFontSizeToFitWidth:YES];
    [self.labelTwo setMinimumScaleFactor:15/25];
    [self.labelTwo setTextAlignment:NSTextAlignmentCenter];
    [self.labelTwo setTextColor:[UIColor blackColor]];
    [self.labelTwo setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.labelTwo];
    
    
    self.startAnimationsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startAnimationsButton setFrame:CGRectMake(20, 250, 280, 30)];
    [self.startAnimationsButton setTitle:@"Start Animations" forState:UIControlStateNormal];
    [self.startAnimationsButton addTarget:self action:@selector(startAnimationsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.startAnimationsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.startAnimationsButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25]];
    [self.view addSubview:self.startAnimationsButton];
    
    self.stopAnimationsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.stopAnimationsButton setFrame:CGRectMake(20, 300, 280, 30)];
    [self.stopAnimationsButton setTitle:@"Stop Animations" forState:UIControlStateNormal];
    [self.stopAnimationsButton addTarget:self action:@selector(stopAnimationsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.stopAnimationsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.stopAnimationsButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25]];
    [self.view addSubview:self.stopAnimationsButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startAnimationsButtonClicked: (id) sender
{
    [self.labelOne GM_setAnimationLTRWithText:LABEL_ONE_TEXT andWithDuration:2.0f andWithRepeatCount:0];
    [self.labelTwo GM_setAnimationRTLWithText:LABEL_TWO_TEXT andWithDuration:1.0f andWithRepeatCount:0];
}

- (void) stopAnimationsButtonClicked: (id) sender
{
    [self.labelOne.layer.mask removeAllAnimations];
    [self.labelOne.layer.mask removeFromSuperlayer];
    
    [self.labelTwo.layer.mask removeAllAnimations];
    [self.labelTwo.layer.mask removeFromSuperlayer];
}

@end
