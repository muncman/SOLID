//
//  MUMasterViewController.h
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MUDetailViewController;

@interface MUMasterViewController : UITableViewController

@property (strong, nonatomic) MUDetailViewController *detailViewController;

@end
