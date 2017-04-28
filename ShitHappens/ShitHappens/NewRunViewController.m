//
//  NewRunViewController.m
//  ShitHappens
//
//  Created by Eugenie Tyan on 18.09.16.
//  Copyright © 2016 Eugenie Tyan. All rights reserved.
//

#import "NewRunViewController.h"
//Github connect

@interface NewRunViewController ()

@property (nonatomic, strong) Run *run;

@end

@implementation NewRunViewController

@synthesize buttonStop, buttonStart;
@synthesize labelTime, labelSpeed, labelDistance, labelQuestion;
@synthesize seconds;
@synthesize distance;
@synthesize locations;
@synthesize locationManager;
@synthesize timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [buttonStart setHidden:NO];
    [labelQuestion setHidden:NO];
    
    [labelDistance setHidden:YES];
    [labelTime setHidden:YES];
    [labelSpeed setHidden:YES];
    [buttonStop setHidden:YES];
    
    //Добавить низкоуровневые констрейны
    NSLayoutConstraint *buttonStopRightConstraint = [NSLayoutConstraint constraintWithItem:buttonStop
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0f constant:-40.0f];
    
    NSLayoutConstraint *buttonStopLeftConstraint = [NSLayoutConstraint constraintWithItem:buttonStop
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0f constant:40.0f];
    
    NSLayoutConstraint *buttonStopBottomConstraint = [NSLayoutConstraint constraintWithItem:buttonStop
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.view
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                 multiplier:1.0f constant:-40.0f];
    
    NSLayoutConstraint *buttonStartRightConstraint = [NSLayoutConstraint constraintWithItem:buttonStart
                                                                                  attribute:NSLayoutAttributeRight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.view
                                                                                  attribute:NSLayoutAttributeRight
                                                                                 multiplier:1.0f constant:-40.0f];
    
    NSLayoutConstraint *buttonStartLeftConstraint = [NSLayoutConstraint constraintWithItem:buttonStart
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeLeft
                                                                                multiplier:1.0f constant:40.0f];
    
    NSLayoutConstraint *buttonStartBottomConstraint = [NSLayoutConstraint constraintWithItem:buttonStart
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:buttonStop
                                                                                  attribute:NSLayoutAttributeTop
                                                                                 multiplier:1.0f constant:20.0f];
    
    NSLayoutConstraint *labelQuestionRightConstraint = [NSLayoutConstraint constraintWithItem:labelQuestion
                                                                                    attribute:NSLayoutAttributeRight
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeRight
                                                                                   multiplier:1.0f constant:-40.0f];
    
    NSLayoutConstraint *labelQuestionLeftConstraint = [NSLayoutConstraint constraintWithItem:labelQuestion
                                                                                   attribute:NSLayoutAttributeLeft
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeLeft
                                                                                  multiplier:1.0f constant:40.0f];
    
    NSLayoutConstraint *labelQuestionBottomConstraint = [NSLayoutConstraint constraintWithItem:labelQuestion
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:buttonStart
                                                                                     attribute:NSLayoutAttributeTop
                                                                                    multiplier:1.0f constant:40.0f];
    
    NSLayoutConstraint *labelSpeedRightConstraint = [NSLayoutConstraint constraintWithItem:labelSpeed
                                                                                    attribute:NSLayoutAttributeRight
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeRight
                                                                                   multiplier:1.0f constant:-20.0f];
    
    NSLayoutConstraint *labelSpeedLeftConstraint = [NSLayoutConstraint constraintWithItem:labelSpeed
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0f constant:20.0f];
    
    NSLayoutConstraint *labelSpeedBottomConstraint = [NSLayoutConstraint constraintWithItem:labelSpeed
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:labelQuestion
                                                                                  attribute:NSLayoutAttributeTop
                                                                                 multiplier:1.0f constant:20.0f];
    
    NSLayoutConstraint *labelTimeRightConstraint = [NSLayoutConstraint constraintWithItem:labelTime
                                                                                attribute:NSLayoutAttributeRight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeRight
                                                                               multiplier:1.0f constant:-20.0f];
    
    NSLayoutConstraint *labelTimeLeftConstraint = [NSLayoutConstraint constraintWithItem:labelTime
                                                                               attribute:NSLayoutAttributeLeft
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeLeft
                                                                              multiplier:1.0f constant:20.0f];
    
    NSLayoutConstraint *labelTimeBottomConstraint = [NSLayoutConstraint constraintWithItem:labelTime
                                                                                 attribute:NSLayoutAttributeBottom
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:labelSpeed
                                                                                 attribute:NSLayoutAttributeTop
                                                                                multiplier:1.0f constant:20.0f];
    
    NSLayoutConstraint *labelDistanceRightConstraint = [NSLayoutConstraint constraintWithItem:labelDistance
                                                                                    attribute:NSLayoutAttributeRight
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeRight
                                                                                   multiplier:1.0f constant:-20.0f];
    
    NSLayoutConstraint *labelDistanceLeftConstraint = [NSLayoutConstraint constraintWithItem:labelDistance
                                                                                   attribute:NSLayoutAttributeLeft
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self.view
                                                                                   attribute:NSLayoutAttributeLeft
                                                                                  multiplier:1.0f constant:20.0f];
    
    NSLayoutConstraint *labelDistanceBottomConstraint = [NSLayoutConstraint constraintWithItem:labelDistance
                                                                                     attribute:NSLayoutAttributeBottom
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:labelTime
                                                                                     attribute:NSLayoutAttributeTop
                                                                                    multiplier:1.0f constant:20.0f];
    
    /*NSLayoutConstraint *labelDistanceTopConstraint = [NSLayoutConstraint constraintWithItem:labelDistance
                                                                                    attribute:NSLayoutAttributeTop
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeTop
                                                                                   multiplier:1.0f constant:20.0f];*/
    
    [self.view addConstraint:buttonStopRightConstraint];
    [self.view addConstraint:buttonStopLeftConstraint];
    [self.view addConstraint:buttonStopBottomConstraint];
    [self.view addConstraint:buttonStartLeftConstraint];
    [self.view addConstraint:buttonStartRightConstraint];
    [self.view addConstraint:buttonStartBottomConstraint];
    [self.view addConstraint:labelQuestionLeftConstraint];
    [self.view addConstraint:labelQuestionRightConstraint];
    [self.view addConstraint:labelQuestionBottomConstraint];
    [self.view addConstraint:labelSpeedLeftConstraint];
    [self.view addConstraint:labelSpeedRightConstraint];
    [self.view addConstraint:labelSpeedBottomConstraint];
    [self.view addConstraint:labelTimeLeftConstraint];
    [self.view addConstraint:labelTimeRightConstraint];
    [self.view addConstraint:labelTimeBottomConstraint];
    [self.view addConstraint:labelDistanceLeftConstraint];
    [self.view addConstraint:labelDistanceRightConstraint];
    [self.view addConstraint:labelDistanceBottomConstraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonStartPressed:(id)sender
{
    [buttonStart setHidden: YES];
    [labelQuestion setHidden: YES];
    [labelDistance setHidden: NO];
    [labelTime setHidden: NO];
    [labelSpeed setHidden: NO];
    [buttonStop setHidden: NO];

    self.seconds = 0;
    self.distance = 0;
    self.locations = [NSMutableArray array];
    self.timer = [NSTimer scheduledTimerWithTimeInterval: (1.0) target: self selector: @selector (eachSecond) userInfo: nil repeats: YES];
    [self startLocationUpdates];
}

- (IBAction)buttonStopPressed:(id)sender
{
    //UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @" " message: @"Finish the running?" preferredStyle:UIAlertControllerStyleAlert];
    //[self presentViewController:alertController animated: YES completion:nil];
    //[self performSegueWithIdentifier: RunDetails sender:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[segue destinationViewController] setRun: self.run];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}

- (void) eachSecond
{
    self.seconds ++;
    [labelTime setText: [NSString stringWithFormat: @"Time: %@", [MathController stringifyTime: seconds]]];
    [labelDistance setText: [NSString stringWithFormat: @"Distance: %@", [MathController stringifyDistance: distance]]];
    [labelSpeed setText: [NSString stringWithFormat: @"Speed: %@", [MathController stringifySpeed: distance overTime: seconds]]];
}

- (void) startLocationUpdates
{
    if (self.locationManager == nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest; //точность местоположения
    self.locationManager.activityType = CLActivityTypeFitness; //
    self.locationManager.distanceFilter = 1;
    
    [self.locationManager startUpdatingLocation];
    [self locationManager: locationManager didUpdateLocations: locations];
}

- (void)locationManager:(CLLocationManager *)manager //Неработающий блок подсчета дистанции ппробовать переделать с помощью HK
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"ShitHappens");
    for (CLLocation *newLocation in locations) {
        if (newLocation.horizontalAccuracy < 20) {
            
            // update distance
            if (self.locations.count > 0) {
                self.distance += [newLocation distanceFromLocation:self.locations.lastObject];
                NSLog(@"%f", distance);
            }
            
            [self.locations addObject:newLocation];
        }
    }
}

@end
