//
//  NewRunViewController.h
//  ShitHappens
//
//  Created by Eugenie Tyan on 18.09.16.
//  Copyright © 2016 Eugenie Tyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Run.h"
#import "MathController.h"
#import <CoreLocation/CoreLocation.h>
#import "Location.h"
#import <HealthKit/HealthKit.h>

@interface NewRunViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UIButton *buttonStart;
@property (weak, nonatomic) IBOutlet UIButton *buttonStop;
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion;
@property (weak, nonatomic) IBOutlet UILabel *labelDistance;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelSpeed;
@property int seconds;
@property float distance;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *locations;
@property (strong, nonatomic) NSTimer *timer;

@end
