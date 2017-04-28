//
//  MathController.m
//  ShitHappens
//
//  Created by Eugenie Tyan on 19.09.16.
//  Copyright © 2016 Eugenie Tyan. All rights reserved.
//

#import "MathController.h"


@implementation MathController

+ (NSString *) stringifyDistance:(float)meters
{
    return [NSString stringWithFormat: @"%.2f km", (meters / 1000)];
}

+ (NSString *) stringifyTime: (int) seconds; //вывод времени
{
    int remainingSeconds = seconds;
    int hours = remainingSeconds / 3600;
    remainingSeconds = remainingSeconds - hours * 3600;
    int minutes = remainingSeconds / 60;
    remainingSeconds = remainingSeconds - minutes * 60;
    
    if (hours > 0)
    {
        return [NSString stringWithFormat: @"%02i:%02i:%02i", hours, minutes, seconds];
    }
    else if (minutes > 0)
    {
        return [NSString stringWithFormat: @"%02i:%02i", minutes, seconds];
    }
    else
    {
        return [NSString stringWithFormat: @"00:%02i", seconds];
    }
}

+ (NSString *) stringifySpeed: (float) meters overTime: (int) seconds;
{
    if (seconds == 0 || meters == 0)
    {
        return @"0";
    }
    
    float speed = ((meters * 3600)/(float)(seconds * 1000));
    
    return [NSString stringWithFormat: @"%f km/h", speed];
}


@end
