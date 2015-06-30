//
//  ViewController.m
//  FISAutoLayout Intro
//
//  Created by Amitai Blickstein on 6/29/15.
//  Copyright (c) 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ViewController.h"
#import <sys/utsname.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *ipsumTextView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (nonatomic, strong) NSLayoutConstraint *textfieldBottomConstraint; /// Needs to be a property because it changes dynamically with orientation.
@property (nonatomic, strong) NSString *machineName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDeviceModelVersion];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    NSNotificationCenter* notifCenter = [NSNotificationCenter defaultCenter];
    [notifCenter addObserver:self
                    selector:@selector(orientationChanged:)
                        name:UIDeviceOrientationDidChangeNotification
                      object:nil];

    /**
     *  Prepares the views for new constraints.
     */
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.ipsumTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    [self.ipsumTextView removeConstraints:self.ipsumTextView.constraints];
    [self.rightButton removeConstraints:self.rightButton.constraints];
    [self.leftButton removeConstraints:self.leftButton.constraints];

    // item1's attribute = item2's attribute * multiplier + constant
    /// UITextfield's placement withint the Scrollview.
    NSLayoutConstraint *textfieldPlacementLeft = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier:1.0
                                                                               constant:10.0];
    
    NSLayoutConstraint *textfieldPlacementRight = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                               attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeRight 
                                                                              multiplier:1.0
                                                                                constant:-10.0];
    
    NSLayoutConstraint *textfieldPlacementTop = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                               attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop 
                                                                              multiplier:1.0
                                                                                constant:20.0];
    
    self.textfieldBottomConstraint = [NSLayoutConstraint constraintWithItem:self.ipsumTextView
                                                                  attribute:NSLayoutAttributeBottom 
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.rightButton
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:-20.0];
    
    /**
     *  Button(s) constraints
     */
    
    NSLayoutConstraint *rightButtonRight = [NSLayoutConstraint constraintWithItem:self.rightButton
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0
                                                                         constant:-10.0];
    
    NSLayoutConstraint *rightButtonBottom = [NSLayoutConstraint constraintWithItem:self.rightButton
                                                                         attribute:NSLayoutAttributeBottom
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                          constant:-10.0];
    
    NSLayoutConstraint *leftButtonLeft = [NSLayoutConstraint constraintWithItem:self.leftButton
                                                                        attribute:NSLayoutAttributeLeft 
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1.0
                                                                         constant:10.0];
    
    NSLayoutConstraint *leftButtonBottom = [NSLayoutConstraint constraintWithItem:self.leftButton
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0
                                                                         constant:-10.0];
    
    [self.view addConstraint:textfieldPlacementLeft];
    [self.view addConstraint:textfieldPlacementRight];
    [self.view addConstraint:textfieldPlacementTop];
    [self.view addConstraint:self.textfieldBottomConstraint];
    [self.view addConstraint:rightButtonRight];
    [self.view addConstraint:rightButtonBottom];
    [self.view addConstraint:leftButtonLeft];
    [self.view addConstraint:leftButtonBottom];
}

-(void)orientationChanged:(NSNotification*)notification {
    UIDevice *thisPhone = notification.object;
    
    if ([self.machineName isEqualToString:@"iPhone 4,1"]) {
        self.textfieldBottomConstraint.constant = -30;
        return;
    }
    
    if (UIDeviceOrientationIsPortrait(thisPhone.orientation)) {
        self.textfieldBottomConstraint.constant = -20.0;
        NSLog(@"I'm 20! (portrait)");
        NSLog(@"This is an: %@", self.machineName);
    } else if (UIDeviceOrientationIsLandscape(thisPhone.orientation)) {
        self.textfieldBottomConstraint.constant = -10.0; 
        NSLog(@"I'm 10! (landscape)");
    } else return;
    
}


-(void)setDeviceModelVersion {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    self.machineName = [NSString stringWithCString:systemInfo.machine
                                          encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
