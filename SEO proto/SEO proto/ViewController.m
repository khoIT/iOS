//
//  ViewController.m
//  SEO proto
//
//  Created by Khoi Tran on 2/27/13.
//  Copyright (c) 2013 Khoi Tran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize courseKeys,courses;
@synthesize courseKeys_web,courses_web;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (section == 0) {
        return [courses count]  ;
    } else {
        return [courses_web count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;{

    if (section == 0){
        return @"Finance Sector";
    } else {
        return @"NGO";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]
                                 initWithStyle:UITableViewCellStyleSubtitle
                                 reuseIdentifier:@"cell"];
    }
    
    NSString *currentCourseName; //= [courseKeys objectAtIndex:[indexPath row]];

    //Which section are we in
    if ([indexPath section] == 0){
        currentCourseName = [courseKeys objectAtIndex:indexPath.row];
    } else {
        currentCourseName = [courseKeys_web objectAtIndex:indexPath.row];
    }
    
    [[cell textLabel]setText:currentCourseName];
   
    /*
    //Get the author name
    NSString *currentAuthorName;
    if ([indexPath section] == 0){
        currentAuthorName = [courses objectForKey:[courseKeys objectAtIndex:indexPath.row]];
    } else {
        currentAuthorName = [courses_web objectForKey:[courseKeys_web objectAtIndex:indexPath.row]];    }
    
    [[cell detailTextLabel] setText:currentAuthorName];
    */
    
    //Retrieve an image

    NSString *imagefile = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"logo%i",indexPath.row]
                                                          ofType:@"png"];
    UIImage *image = [[UIImage alloc]   initWithContentsOfFile:imagefile];
    
    //Add the image to table cell
    [[cell imageView] setImage:image];
    
    //accessor type
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // load first set
    NSString *myFile = [[NSBundle mainBundle]
                        pathForResource:@"courses" ofType:@"plist"];
    
    courses = [[NSDictionary alloc] initWithContentsOfFile:myFile];
    
    courseKeys = [courses allKeys];
    
    //load new set
    myFile = [[NSBundle mainBundle]
              pathForResource:@"courses_web" ofType:@"plist"];

    courses_web = [[NSDictionary alloc] initWithContentsOfFile:myFile];
    
    courseKeys_web = [courses_web allKeys];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
