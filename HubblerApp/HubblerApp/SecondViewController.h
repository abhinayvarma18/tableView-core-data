//
//  SecondViewController.h
//  HubblerApp
//
//  Created by Abhinay Varma on 13/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource,
UITableViewDelegate>{

NSMutableArray *myData;
    
}
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *gender;
@property (nonatomic,retain) NSString *dob;
@property (nonatomic,retain) NSString *email;
@property (nonatomic,retain) NSString *phoneNumber;
@property (nonatomic,retain) NSString *address;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
