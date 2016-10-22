//
//  SimpleTableCell.h
//  HubblerApp
//
//  Created by Abhinay Varma on 16/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *dob;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;

@end
