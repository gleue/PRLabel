//
//  PRLabel.m
//  PRLabel
//
//  Created by Pietro Rea on 9/23/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "PRLabel.h"

@implementation PRLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.respondsToTouch = YES;
    }
    
    return self;
}

- (BOOL)isUserInteractionEnabled
{
    return self.respondsToTouch;
}

- (BOOL)canBecomeFirstResponder
{
    return self.respondsToTouch;
}

- (BOOL)becomeFirstResponder {
    
    if ([super becomeFirstResponder]) {
        
        if ([self.delegate respondsToSelector:@selector(labelDidBecomeFirstResponder:)]) {
            
            [self.delegate labelDidBecomeFirstResponder:self];
        }

        return YES;

    } else {
        
        return NO;
    }
}

- (BOOL)resignFirstResponder {

    if ([super resignFirstResponder]) {

        if ([self.delegate respondsToSelector:@selector(labelDidResignFirstResponder:)]) {
            
            [self.delegate labelDidResignFirstResponder:self];
        }

        return YES;
        
    } else {
        
        return NO;
    }
}

# pragma mark - UIResponder overrides

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self becomeFirstResponder];
}

@end
