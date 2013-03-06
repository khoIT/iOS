//
//  ViewController.h
//  SEO proto
//
//  Created by Khoi Tran on 2/27/13.
//  Copyright (c) 2013 Khoi Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITabBarDelegate>

@property (nonatomic, strong) NSDictionary *courses;
@property (nonatomic, strong) NSArray *courseKeys;

// Add NSDictionary and NSArray for second set
@property (nonatomic, strong) NSDictionary *courses_web;
@property (nonatomic, strong) NSArray *courseKeys_web;

@end
