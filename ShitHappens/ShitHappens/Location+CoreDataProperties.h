//
//  Location+CoreDataProperties.h
//  ShitHappens
//
//  Created by Eugenie Tyan on 25.07.16.
//  Copyright © 2016 Eugenie Tyan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Location (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSDate *timestamp;
@property (nullable, nonatomic, retain) Run *run;

@end

NS_ASSUME_NONNULL_END
