//
//  ViewController.m
//  SK_KeyboardAccessoryExample
//
//  Created by Saroj Sharma on 20/09/12.
//  Copyright (c) 2012 ____. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)_textField{
    UIView *accessoryView=[[[NSBundle mainBundle] loadNibNamed:@"AccessoryView" owner:self options:nil] lastObject];
    _textField.inputAccessoryView=accessoryView;
//    _textField.inputView=accessoryView;    
    accessoryView=nil;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

#pragma mark- Keyboard Delegate
- (void)keyboardWillShowNotification:(NSNotification*)notification{

}

- (void)keyboardWillHideNotification:(NSNotification*)notification{
    
}

#pragma mark- IBAction

- (IBAction)DoneTapped:(id)sender {
    [textField resignFirstResponder];
}

- (IBAction)CancelTapped:(id)sender {
    [textField resignFirstResponder];        
}

@end
