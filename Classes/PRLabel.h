//
//  PRLabel.h
//  PRLabel
//
//  Created by Pietro Rea on 9/23/12.
//  Copyright (c) 2012 Pietro Rea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRLabel;

@protocol PRLabelDelegate <NSObject>

@optional

- (BOOL)labelShouldBecomeFirstResponder:(PRLabel *)label;
- (void)labelDidBecomeFirstResponder:(PRLabel *)label;

- (BOOL)labelShouldResignFirstResponder:(PRLabel *)label;
- (void)labelDidResignFirstResponder:(PRLabel *)label;

@end

@interface PRLabel : UILabel

@property (strong, nonatomic, readwrite) UIView* inputView;
@property (strong, nonatomic, readwrite) UIView* inputAccessoryView;

@property (weak, nonatomic) id <PRLabelDelegate> delegate;

@property (assign, nonatomic, getter = doesRespondToTouch) BOOL respondsToTouch;

@end
