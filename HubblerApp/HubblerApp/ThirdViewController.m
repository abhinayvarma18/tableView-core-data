//
//  ThirdViewController.m
//  HubblerApp
//
//  Created by Abhinay Varma on 13/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import "ThirdViewController.h"
#import "ViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"sendDob"])
    {
        ViewController *vc2 = [segue destinationViewController];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        vc2.dobString = [dateFormatter stringFromDate:(self.pickerView.date)];
    }
}
- (IBAction)sendDob:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.dobString = [NSDateFormatter localizedStringFromDate:(self.pickerView.date)
                                                              dateStyle:NSDateFormatterShortStyle
                                                              timeStyle:0];
    viewController.value = self.gender;
    viewController.phoneNumber = self.phoneNumber;
    viewController.address =self.address;
    viewController.email = self.email;
    viewController.name = self.name;
    [self.navigationController pushViewController:viewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
