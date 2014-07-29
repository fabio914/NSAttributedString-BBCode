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
    [self.testLabel setAttributedText:[NSAttributedString attributedStringWithBBCode:self.textField.text delegate:self]];
}

- (NSDictionary *)attributesForTag:(NSString *)tag params:(NSDictionary *)params previous:(NSDictionary *)attributes {
    
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:attributes];
    
    /* [code][/code] */
    if([tag isEqualToString:@"code"]) {
        
        [result setObject:[UIFont fontWithName:@"Courier New" size:11.f] forKey:NSFontAttributeName];
    }
    
    return result;
}

- (void)dealloc {

    [_testLabel release];
    [_textField release];
    [super dealloc];
}

@end
