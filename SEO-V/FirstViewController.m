//
//  FirstViewController.m
//  SEO-V
//
//  Created by Khoi Tran on 2/28/13.
//  Copyright (c) 2013 Khoi Tran. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize company,companyKeys;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
        return [company count]  ;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    
    NSString *currentCompanyName = [companyKeys objectAtIndex:[indexPath row]];

    /*
    //Which section are we in
    if ([indexPath section] == 0){
        currentCourseName = [courseKeys objectAtIndex:indexPath.row];
    } else {
        currentCourseName = [courseKeys_web objectAtIndex:indexPath.row];
    }
    
    
    
   
     //Get the author name
     NSString *currentAuthorName;
     if ([indexPath section] == 0){
     currentAuthorName = [courses objectForKey:[courseKeys objectAtIndex:indexPath.row]];
     } else {
     currentAuthorName = [courses_web objectForKey:[courseKeys_web objectAtIndex:indexPath.row]];    }
     
     [[cell detailTextLabel] setText:currentAuthorName];
     */
    
    [[cell textLabel]setText:currentCompanyName];
    
    //Retrieve an image
    
    NSString *imagefile = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"logo%i",indexPath.row]
                                                          ofType:@"png"];
    UIImage *image = [[UIImage alloc]   initWithContentsOfFile:imagefile];
    
    //Add the image to table cell
    [[cell imageView] setImage:image];
    
    //accessor type
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    NSString *myFile = [[NSBundle mainBundle]
                        pathForResource:@"company" ofType:@"plist"];
    
    company = [[NSDictionary alloc] initWithContentsOfFile:myFile];
    
    companyKeys = [company allKeys];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
