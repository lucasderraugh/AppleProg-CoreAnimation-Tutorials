//
//  KeyframeView.m
//  Lesson 5
//
//  Created by Lucas Derraugh on 7/11/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "KeyframeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation KeyframeView {
    NSImageView *_imageView;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0,
                                                                   frame.size.width/3.0,
                                                                   frame.size.height/3.0)];
        [_imageView setImageScaling:NSImageScaleAxesIndependently];
        [_imageView setImage:[NSImage imageNamed:@"image.png"]];
        [self addSubview:_imageView];
        [self setUpAnimation];
    }
    
    return self;
}

- (void)setUpAnimation {
    CAKeyframeAnimation *keyframeAni = [CAKeyframeAnimation animation];
    keyframeAni.duration = 5.0;
    keyframeAni.calculationMode = kCAAnimationPaced;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddArcToPoint(path, NULL, 0, 200, 200, 200, 200);
    CGPathAddArcToPoint(path, NULL, 400, 200, 400, 0, 200);
    CGPathAddLineToPoint(path, NULL, 200, 300);
    CGPathCloseSubpath(path);
    keyframeAni.path = path;
    
    CGPathRelease(path);
    
    [_imageView setAnimations:@{@"frameOrigin": keyframeAni}];
}

- (void)mouseDown:(NSEvent *)theEvent {
    [[_imageView animator] setFrame:[_imageView frame]];
}

@end
