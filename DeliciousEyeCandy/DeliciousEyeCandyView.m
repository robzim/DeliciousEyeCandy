//
//  DeliciousEyeCandyView.m
//  DeliciousEyeCandy
//
//  Created by Robert Zimmelman on 5/29/17.
//  Copyright © 2017 Robert Zimmelman. All rights reserved.
//

#import "DeliciousEyeCandyView.h"

@implementation DeliciousEyeCandyView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
