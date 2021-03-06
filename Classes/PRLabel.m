//
//  PRLabel.m
//  PRLabel
//
//  Created by Pietro Rea on 9/23/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import "PRLabel.h"

@implementation PRLabel

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.respondsToTouch = YES;
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.respondsToTouch = YES;
    }
    
    return self;
}

- (BOOL)isUserInteractionEnabled {

    return self.respondsToTouch;
}

- (BOOL)canBecomeFirstResponder {

    if ([self.delegate respondsToSelector:@selector(labelShouldBecomeFirstResponder:)]) {
        
        return [self.delegate labelShouldBecomeFirstResponder:self];
        
    } else {
        
        return self.respondsToTouch;
    }
}

- (BOOL)becomeFirstResponder {
    
    BOOL wasFirstResponder = self.isFirstResponder;

    if ([super becomeFirstResponder]) {
        
        if (wasFirstResponder == NO && [self.delegate respondsToSelector:@selector(labelDidBecomeFirstResponder:)]) {

            [self.delegate labelDidBecomeFirstResponder:self];
        }

        return YES;

    } else {
        
        return NO;
    }
}

- (BOOL)canResignFirstResponder {

    if ([self.delegate respondsToSelector:@selector(labelShouldResignFirstResponder:)]) {
        
        return [self.delegate labelShouldResignFirstResponder:self];
        
    } else {
        
        return YES;
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    [self becomeFirstResponder];
}

@end
