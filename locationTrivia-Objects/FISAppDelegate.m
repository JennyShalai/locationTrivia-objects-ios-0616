//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISTrivium.h"
#import "FISLocation.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
    
}


- (NSArray *)allLocationNames {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for(FISLocation *location in self.locations) {
        [names addObject:location.name];
    }
    return names;
}

- (FISLocation *)locationNamed:(NSString *)name {
    for(FISLocation *location in self.locations) {
        if([name isEqualToString:location.name]) {
            return location;
        }
    }
    return nil;
}

- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    NSMutableArray *locationInRange = [[NSMutableArray alloc] init];
    for(FISLocation *location in self.locations) {
        BOOL isLatitudeInRange = (location.latitude <= (latitude + margin) && location.latitude >= (latitude - margin));
        BOOL isLongitudeInRange = (location.longitude <= (longitude + margin) && location.longitude >= (longitude - margin));
        if(isLatitudeInRange && isLongitudeInRange) {
            [locationInRange addObject:location];
        }
    }
    return locationInRange;
}



@end
