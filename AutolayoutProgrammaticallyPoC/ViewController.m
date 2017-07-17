//
//  ViewController.m
//  AutolayoutProgrammaticallyPoC
//
//  Created by Amin Siddiqui on 17/07/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *centerView;
    
    CGFloat whiteIndex;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    whiteIndex = 1.0f;
    
    [self setTopView];
    centerView = [self setCenterView];
    [self setAboveCenterView];
}

-(UIView *)setTopView {
    /*
     Height : 60
     Width  : self.view.frame.size.width - (self.view.frame.size.width / 4)
     X      : self.view.center.x - Width/2
     Y      : -Height
     */
    
    UIView *newView = [UIView new];
    [newView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [newView setBackgroundColor:[UIColor colorWithWhite:(whiteIndex = whiteIndex - 0.1f) alpha:1.0f]];
    [self.view addSubview:newView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.75f
                                                           constant:0.0f]];
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:0
                                                       multiplier:1.0f
                                                         constant:60.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0.0f]];
    
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:newView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f
                                                                      constant:-60.0f];
    [self.view addConstraint:constraintTop];
    [self.view layoutIfNeeded];
    
    constraintTop.constant = 20.0f;
    [UIView animateWithDuration:1.0f
                          delay:1.0f
                        options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:nil];
    return newView;
}

-(UIView *)setCenterView {
    /*
     Height : 100
     Width  : 100
     X      : self.view.center.x - Width/2
     Y      : self.view.center.y - Height/2
     */
    
    UIView *newView = [UIView new];
    [newView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [newView setBackgroundColor:[UIColor colorWithWhite:(whiteIndex = whiteIndex - 0.1f) alpha:1.0f]];
    [self.view addSubview:newView];
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:0
                                                       multiplier:1.0f
                                                         constant:100.0f]];
    
    [newView addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:0
                                                       multiplier:1.0f
                                                         constant:100.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0f
                                                           constant:0.0f]];
    
    return newView;
}

-(UIView *)setAboveCenterView {
    /*
     Height : centerView.frame.size.height/2
     Width  : self.view.frame.size.width - 40
     X      : self.view.frame.origin.x + 20
     Y      : centerView.frame.origin.y - 20
     */
    
    UIView *newView = [UIView new];
    [newView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [newView setBackgroundColor:[UIColor colorWithWhite:(whiteIndex = whiteIndex - 0.1f) alpha:1.0f]];
    [self.view addSubview:newView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:centerView
                                                        attribute:NSLayoutAttributeHeight
                                                       multiplier:0.5f
                                                         constant:0.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:centerView
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0f
                                                         constant:-20.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                          attribute:NSLayoutAttributeLeading                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0f
                                                           constant:20.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0f
                                                           constant:-20.0f]];
    
    return newView;
}

@end
