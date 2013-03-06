//
//  FirstViewController.h
//  SEO-V
//
//  Created by Khoi Tran on 2/28/13.
//  Copyright (c) 2013 Khoi Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *company;
@property (nonatomic, strong) NSArray *companyKeys;

@end
