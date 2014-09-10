//
//  KeyButton.m
//  Stroke5InputMethod
//
//  Created by Wan Leung Wong on 10/7/14.
//  Copyright (c) 2014 Wan Leung Wong. All rights reserved.
//

#import "KeyButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation KeyButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        layer.cornerRadius = 10;
        layer.borderColor = [UIColor blueColor].CGColor;
        layer.borderWidth = 2;
        layer.shadowColor = [UIColor blackColor].CGColor;
        layer.shadowOpacity = 0.8;
        layer.shadowOffset = CGSizeMake(1, 1);
        layer.shadowRadius = 5;
        [self.layer addSublayer:layer];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
