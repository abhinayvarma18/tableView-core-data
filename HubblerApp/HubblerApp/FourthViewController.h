//
//  FourthViewController.h
//  HubblerApp
//
//  Created by Abhinay Varma on 14/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewc;

@property (weak, nonatomic) IBOutlet UIView *viewSmall;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;



@end
