//
//  MathController.h
//  ShitHappens
//
//  Created by Eugenie Tyan on 19.09.16.
//  Copyright © 2016 Eugenie Tyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathController : NSObject

+ (NSString *) stringifyDistance: (float) meters;
+ (NSString *) stringifyTime: (int) seconds;
+ (NSString *) stringifySpeed: (float) meters overTime: (int) seconds;

@end
