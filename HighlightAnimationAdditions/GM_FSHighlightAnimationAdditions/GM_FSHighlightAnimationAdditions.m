//
//  UILabel+FSHighlightAnimationAdditions.m
//  effect
//
//  Created by Jose A. Gabriel Massana on 05/03/2013.
//  Copyright (c) 2013 Jose A. Gabriel Massana. All rights reserved.
//

#import "GM_FSHighlightAnimationAdditions.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation UILabel (GM_FSHighlightAnimationAdditions)

- (void)GM_setAnimationLTRWithText:(NSString*)text andWithDuration: (CFTimeInterval) duration andWithRepeatCount: (float) repeatCount
{
    //repeatCount equals zero will cause the animation to repeat forever.
    if (repeatCount == 0)
    {
        repeatCount = HUGE_VALF;
    }
    
    self.text = text;
    CALayer *maskLayer = [CALayer layer];
    
    // Mask image ends with 0.15 opacity on both sides. Set the background color of the layer
    // to the same value so the layer can extend the mask image.
    maskLayer.backgroundColor = [[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.15f] CGColor];
    maskLayer.contents = (id)[[UIImage imageNamed:@"Mask.png"] CGImage];
    
    // Center the mask image on twice the width of the text layer, so it starts to the left
    // of the text layer and moves to its right when we translate it by width.
    maskLayer.contentsGravity = kCAGravityCenter;
    maskLayer.frame = CGRectMake(self.frame.size.width * -1, 0.0f, self.frame.size.width * 2, self.frame.size.height);
    
    // Animate the mask layer's horizontal position
    CABasicAnimation *maskAnim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    maskAnim.byValue = [NSNumber numberWithFloat:self.frame.size.width];
    maskAnim.repeatCount = repeatCount; //HUGE_VALF will cause the animation to repeat forever.
    maskAnim.duration = duration;
    [maskLayer addAnimation:maskAnim forKey:@"slideAnim"];
    
    self.layer.mask = maskLayer;

}


- (void)GM_setTextWithChangeAnimationLTR:(NSString*)text
{
    [self GM_setAnimationLTRWithText:text andWithDuration:0 andWithRepeatCount:2.0f];
}


- (void)GM_setAnimationRTLWithText:(NSString*)text andWithDuration: (CFTimeInterval) duration andWithRepeatCount: (float) repeatCount
{
    //repeatCount equals zero will cause the animation to repeat forever.
    if (repeatCount == 0)
    {
        repeatCount = HUGE_VALF;
    }
    
    self.text = text;
    CALayer *maskLayer = [CALayer layer];
    
    // Mask image ends with 0.15 opacity on both sides. Set the background color of the layer
    // to the same value so the layer can extend the mask image.
    maskLayer.backgroundColor = [[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.15f] CGColor];
    maskLayer.contents = (id)[[UIImage imageNamed:@"Mask.png"] CGImage];
    
    // Center the mask image on 0.0 of the text layer, so it starts to the right
    // of the text layer and moves to its left when we translate it by width.
    maskLayer.contentsGravity = kCAGravityCenter;
    maskLayer.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width * 2, self.frame.size.height);
    
    // Animate the mask layer's horizontal position
    CABasicAnimation *maskAnim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    maskAnim.byValue = [NSNumber numberWithFloat:self.frame.size.width * -1];
    maskAnim.repeatCount = repeatCount; // HUGE_VALF will cause the animation to repeat forever.
    maskAnim.duration = duration;
    [maskLayer addAnimation:maskAnim forKey:@"slideAnim"];
    
    self.layer.mask = maskLayer;

}

- (void)GM_setTextWithChangeAnimationRTL:(NSString*)text
{
    [self GM_setAnimationRTLWithText:text andWithDuration:0 andWithRepeatCount:2.0f];
}

@end

