//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Flatiron School on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@interface FISLocation()

@end

@implementation FISLocation


- (instancetype)init {
    return [self initWithName:@"" latitude:0.0 longitude:0.0];;
}

- (instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    if(self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if(length < self.name.length) {
        return [self.name substringToIndex:length];
    }
    return self.name;
}

- (BOOL)hasValidData {
    BOOL isValidName = ((self.name != nil) && ![self.name isEqualToString:@""]);
    BOOL isValidLatitude = ((self.latitude > -90.0) && self.latitude < 90.0);
    BOOL isValidLongitude = ((self.longitude > -180.0) && self.longitude < 180.0);
    if(isValidName && isValidLatitude && isValidLongitude) {
        return YES;
    }
    return NO;
}

- (FISTrivium *)triviumWithMostLikes {
    if([self.trivia isEqual:@[]]) {
        return nil;
    } else {
        NSSortDescriptor *filter = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
        NSArray *filtered = [self.trivia sortedArrayUsingDescriptors:@[filter]];
        return filtered[0];
    }
    return nil;
}

@end
