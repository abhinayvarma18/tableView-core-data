//
//  FourthViewController.m
//  HubblerApp
//
//  Created by Abhinay Varma on 14/08/16.
//  Copyright (c) 2016 Abhinay Varma. All rights reserved.
//

#import "FourthViewController.h"
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ViewController.h"
#import "SimpleTableCell.h"

@interface FourthViewController ()
@property (strong) NSArray *devices;
@property (nonatomic,strong)NSManagedObjectContext* managedObjectContext;
@property (nonatomic,retain)NSFetchedResultsController *fetchedResultsController;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewc.allowsMultipleSelectionDuringEditing = NO;
    CGFloat borderWidth = 1.3f;
    self.viewSmall.layer.borderColor = [UIColor whiteColor].CGColor;
    self.viewSmall.layer.borderWidth = borderWidth;
    [self fetchData];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    self.label2.text = [NSString stringWithFormat:@"%ld",(long)[components day]];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString *monthName = [[df monthSymbols] objectAtIndex:((long)[components month]-1)];
    self.label1.text =  [monthName substringToIndex:3];
}
-(void) fetchData{
    NSManagedObjectContext *moc ;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Report"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSError *error = nil;
    self.devices = [moc executeFetchRequest:request error:&error];
    if (!self.devices) {
        self.devices = [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"abhinay",@"name",
                         @"9530452298",@"phoneNumber",
                         nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"Simon",@"name",
                         @"95955555",@"phoneNumber",
                         nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"Amelia",@"name",
                         @"5454545432",@"phoneNumber",
                         nil],
                        nil];
    }
    [self.tableViewc reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableViewc deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        NSEntityDescription *productEntity=[NSEntityDescription entityForName:@"Report" inManagedObjectContext:[self managedObjectContext]];
        NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
        [fetch setEntity:productEntity];
        NSPredicate *p=[NSPredicate predicateWithFormat:@"name == %@", [[self.devices objectAtIndex:indexPath.row] valueForKey:@"name"]];
        [fetch setPredicate:p];
        //... add sorts if you want them
        NSError *fetchError;
        NSArray *fetchedProducts=[self.managedObjectContext executeFetchRequest:fetch error:&fetchError];
        for (NSManagedObject *product in fetchedProducts) {
            [[self managedObjectContext] deleteObject:product];
        }
    }
    [self fetchData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Report"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableViewc reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.devices.count;
}
- (IBAction)addReports:(id)sender {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellIdentifier";
    SimpleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
         cell = [[SimpleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.name.text = [[self.devices objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.phoneNumber.text = [NSString stringWithFormat:@"Phone Number: %@",[[self.devices objectAtIndex:indexPath.row] valueForKey:@"phoneNumber"]] ;
    cell.dob.text = [[self.devices objectAtIndex:indexPath.row] valueForKey:@"dob"];
    // Configure the cell...
    return cell;
}
- (IBAction)sendToAdd:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
