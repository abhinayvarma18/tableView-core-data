//
//  SimpleTableCell.m
//  HubblerApp
//
//  Created by Abhinay Varma on 16/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import "SimpleTableCell.h"

@interface SimpleTableCell ()

@end

@implementation SimpleTableCell

@synthesize name = _name;
@synthesize dob = _dob;
@synthesize phoneNumber = _phoneNumber;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
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
