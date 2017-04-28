//
//  DetailViewController.h
//  ShitHappens
//
//  Created by Eugenie Tyan on 25.07.16.
//  Copyright © 2016 Eugenie Tyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MathController.h"
#import "Run.h"
#import "Location.h"

@class Run;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) Run *run;
@property (weak, nonatomic) IBOutlet UILabel *labelDistance;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelSpeed;

@end

