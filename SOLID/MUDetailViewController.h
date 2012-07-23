//
//  MUDetailViewController.h
//  SOLID
//
//  Created by Kevin Munc on 7/8/12.
//  Copyright (c) 2012 Method Up. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MUConcept;

@interface MUDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) MUConcept *detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailTitleLabel;


@end
