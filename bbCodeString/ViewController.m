//
//  ViewController.m
//  bbCodeString
//
//  Created by Fabio Dela Antonio on 7/29/14.
//  Copyright (c) 2014 Bluenose. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+bbCode.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutlet UILabel * testLabel;
@property (retain, nonatomic) IBOutlet UITextField * textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendString:(id)sender {
    
    [self.textField resignFirstResponder];
    [self.testLabel setAttributedText:[NSAttributedString attributedStringWithBBCode:self.textField.text]];
}

- (void)dealloc {

    [_testLabel release];
    [_textField release];
    [super dealloc];
}

@end
