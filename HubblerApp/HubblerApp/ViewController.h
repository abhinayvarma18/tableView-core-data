//
//  ViewController.h
//  HubblerApp
//
//  Created by Abhinay Varma on 12/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *dobField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (nonatomic,retain) NSString *value;
@property (nonatomic,retain) NSString *dobString;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *phoneNumber;
@property (nonatomic,retain) NSString *email;



@end

