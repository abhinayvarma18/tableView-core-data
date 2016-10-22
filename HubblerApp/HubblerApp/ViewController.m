//
//  ViewController.m
//  HubblerApp
//
//  Created by Abhinay Varma on 12/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import <CoreData/CoreData.h>
#import "FourthViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize textField;
@synthesize dobField;
@synthesize genderField;
@synthesize emailField;
@synthesize phoneNumberField;
@synthesize addressField;
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.view endEditing:YES];
    [self.textField setTag:1];
    [self.genderField setTag:2];
    [self.emailField setTag:3];
    [self.phoneNumberField setTag:4];
    [self.dobField setTag:5];
    [self.addressField setTag:6];
    self.genderField.text = self.value;
    self.dobField.text = self.dobString;
    self.textField.text = self.name;
    self.emailField.text = self.email;
    self.phoneNumberField.text = self.phoneNumber;
    self.addressField.text = self.address;
//    [textField setBorderStyle:UITextBorderStyleNone];
////    [textField setNeedsDisplay];
//    [genderField setBorderStyle:UITextBorderStyleNone];
//    [genderField setNeedsDisplay];
//    [emailField setBorderStyle:UITextBorderStyleNone];
//    [emailField setNeedsDisplay];
//    [phoneNumberField setBorderStyle:UITextBorderStyleNone];
//    [phoneNumberField setNeedsDisplay];
//    [dobField setBorderStyle:UITextBorderStyleNone];
//    [dobField setNeedsDisplay];
//    [addressField setBorderStyle:UITextBorderStyleNone];
//    [addressField setNeedsDisplay];

    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
    [genderField.layer addSublayer:border];
    genderField.layer.masksToBounds = YES;
    [emailField.layer addSublayer:border];
    emailField.layer.masksToBounds = YES;
    [phoneNumberField.layer addSublayer:border];
    phoneNumberField.layer.masksToBounds = YES;
    [dobField.layer addSublayer:border];
    dobField.layer.masksToBounds = YES;
    [addressField.layer addSublayer:border];
    addressField.layer.masksToBounds = YES;
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleKeyboard:)];
    [self.view addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)handleKeyboard:(UITapGestureRecognizer *) gesture{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textFiel
{
    if(textFiel.tag==2){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
       SecondViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        viewController.name = textField.text;
        viewController.dob = dobField.text;
        viewController.gender = genderField.text;
        viewController.address = addressField.text;
        viewController.phoneNumber = phoneNumberField.text;
        viewController.email = emailField.text;
         [self.navigationController pushViewController:viewController animated:YES];
    
    }else if(textFiel.tag==5){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        ThirdViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
        viewController.name = textField.text;
        viewController.dob = dobField.text;
        viewController.gender = genderField.text;
        viewController.address = addressField.text;
        viewController.phoneNumber = phoneNumberField.text;
        viewController.email = emailField.text;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
   
    
    
   
    return true;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)saveReport:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Report" inManagedObjectContext:context];
    [newDevice setValue:self.textField.text forKey:@"name"];
    [newDevice setValue:self.dobField.text forKey:@"dob"];
    [newDevice setValue:self.genderField.text forKey:@"gender"];
    [newDevice setValue:self.phoneNumberField.text forKey:@"phoneNumber"];
    [newDevice setValue:self.addressField.text forKey:@"address"];
    [newDevice setValue:self.emailField.text forKey:@"email"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    FourthViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"FourthViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
