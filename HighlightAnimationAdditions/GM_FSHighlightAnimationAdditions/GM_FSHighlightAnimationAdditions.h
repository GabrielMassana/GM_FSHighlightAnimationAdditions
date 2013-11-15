//
//  UILabel+GM_FSHighlightAnimationAdditions.h
//  effect
//
//  Created by Jose A. Gabriel Massana on 05/03/2013.
//  Copyright (c) 2013 Jose A. Gabriel Massana. All rights reserved.
//
//
//
//Project based in this two stackoverflow posts:
//
//Pascal Bourque: http://stackoverflow.com/a/2778232/1381708
//cberkley: http://stackoverflow.com/a/5710097/1381708
//


#import <Foundation/Foundation.h>

@interface UILabel (GM_FSHighlightAnimationAdditions)

- (void)GM_setAnimationLTRWithText:(NSString*)text andWithDuration: (CFTimeInterval) duration andWithRepeatCount: (float) repeatCount;
- (void) GM_setTextWithChangeAnimationLTR:(NSString*)text;
- (void)GM_setAnimationRTLWithText:(NSString*)text andWithDuration: (CFTimeInterval) duration andWithRepeatCount: (float) repeatCount;
- (void) GM_setTextWithChangeAnimationRTL:(NSString*)text;

@end
