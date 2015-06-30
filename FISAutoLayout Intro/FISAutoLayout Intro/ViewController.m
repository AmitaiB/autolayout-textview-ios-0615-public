//
//  ViewController.m
//  FISAutoLayout Intro
//
//  Created by Amitai Blickstein on 6/29/15.
//  Copyright (c) 2015 Amitai Blickstein, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *ipsumTextView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.ipsumTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.ipsumTextView removeConstraints:self.ipsumTextView.constraints];
    [self.rightButton removeConstraints:self.rightButton.constraints];
    [self.leftButton removeConstraints:self.leftButton.constraints];
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
