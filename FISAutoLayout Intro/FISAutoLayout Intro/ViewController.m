//
//  ViewController.m
//  FISAutoLayout Intro
//
//  Created by Amitai Blickstein on 6/29/15.
//  Copyright (c) 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *containerScrollView;
@property (weak, nonatomic) IBOutlet UITextView *ipsumTextView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.containerScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.ipsumTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.containerScrollView removeConstraints:self.containerScrollView.constraints];
    [self.ipsumTextView removeConstraints:self.ipsumTextView.constraints];
    [self.rightButton removeConstraints:self.rightButton.constraints];
    [self.leftButton removeConstraints:self.leftButton.constraints];

    /// item1's attribute = item2's attribute * multiplier + constant
    /// UITextfield's placement withint the Scrollview.
    NSLayoutConstraint *textfieldPlacementLeft = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.containerScrollView
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier:1.0
                                                                               constant:10.0];
    
    NSLayoutConstraint *textfieldPlacementRight = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                               attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.containerScrollView
                                                                               attribute:NSLayoutAttributeRight 
                                                                              multiplier:1.0
                                                                                constant:-10.0];
    
    NSLayoutConstraint *textfieldPlacementTop = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                               attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.containerScrollView
                                                                               attribute:NSLayoutAttributeTop 
                                                                              multiplier:1.0
                                                                                constant:-20.0];
    
    NSLayoutConstraint *textfieldPlacementBottom = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                                attribute:NSLayoutAttributeBottom 
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.rightButton
                                                                                attribute:NSLayoutAttributeTop
                                                                               multiplier:1.0
                                                                                 constant:20.0];
    
    /**
     *  Button(s) constraints
     */
    
    NSLayoutConstraint *rightButtonRight = [NSLayoutConstraint constraintWithItem:self.rightButton
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.containerScrollView
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0
                                                                         constant:10.0];
    
    NSLayoutConstraint *rightButtonBottom = [NSLayoutConstraint constraintWithItem:self.rightButton
                                                                         attribute:NSLayoutAttributeBottom
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.containerScrollView
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                          constant:-10.0];
    
    NSLayoutConstraint *leftButtonLeft = [NSLayoutConstraint constraintWithItem:self.leftButton
                                                                        attribute:NSLayoutAttributeLeft 
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.containerScrollView
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1.0
                                                                         constant:10.0];
    
    NSLayoutConstraint *leftButtonBottom = [NSLayoutConstraint constraintWithItem:self.leftButton
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.containerScrollView
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:10.0];
    
    [self.containerScrollView addConstraint:textfieldPlacementLeft];
    [self.containerScrollView addConstraint:textfieldPlacementRight];
    [self.containerScrollView addConstraint:textfieldPlacementTop];
    [self.containerScrollView addConstraint:textfieldPlacementBottom];
    [self.containerScrollView addConstraint:rightButtonRight];
    [self.containerScrollView addConstraint:rightButtonBottom];
    [self.containerScrollView addConstraint:leftButtonLeft];
    [self.containerScrollView addConstraint:leftButtonBottom];
    
    //    typedef enum: NSInteger {
//        NSLayoutAttributeLeft = 10,
//        NSLayoutAttributeRight = 10,
//        NSLayoutAttributeTop =20,
//        NSLayoutAttributeBottom = 20} NSLayoutAttribute;
//    }
//    
//    NSLayoutAttribute *textfieldPlacement = 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
