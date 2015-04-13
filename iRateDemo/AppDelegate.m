//
//  AppDelegate.m
//  iRateDemo
//
//  Created by Michael Cornell on 4/13/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "AppDelegate.h"
#import "iRate.h"

@interface AppDelegate () <iRateDelegate>

@end

@implementation AppDelegate

// iRate prefers to be configured before app launch
+ (void)initialize {
    [iRate sharedInstance].daysUntilPrompt = 10;
    [iRate sharedInstance].usesUntilPrompt = 10;
    [iRate sharedInstance].remindPeriod = .5; // 12h. 1 == 1 day, aka 24h. use floats for fractional days
    
    [iRate sharedInstance].cancelButtonLabel = @"No thanks";
    [iRate sharedInstance].rateButtonLabel = @"Rate it now";
    [iRate sharedInstance].remindButtonLabel = @"Remind me later";
    
    [iRate sharedInstance].messageTitle = @"Rate the App!";
    [iRate sharedInstance].message = @"Please rate our app! We worked really hard on it :3";
    [iRate sharedInstance].updateMessage = @"There's a new version of the app, and we worked even harder on it!";
    
    [iRate sharedInstance].promptForNewVersionIfUserRated = YES; // irate will not prompt is the app version < app store version
    [iRate sharedInstance].promptAtLaunch = NO; // iRate will always prompt on foregrounding unless this is NO
    
    BOOL debugMode = YES;
    if (debugMode) {
        // point away from staging bundle to real bundle, must point to an app store bundle
        [iRate sharedInstance].applicationBundleID = @"com.facebook.Facebook";
        [iRate sharedInstance].verboseLogging = YES; // it's auto set to YES by DEBUG configuration
        [iRate sharedInstance].previewMode = YES; // rating dialog will always appear, all conditions are irrelevent.
    }
}

-(BOOL)iRateShouldPromptForRating {
    NSLog(@"iRate will pop dialog");
    return YES;
}

- (void)iRateDidPromptForRating {
    NSLog(@"iRate did pop");
}

- (void)iRateUserDidAttemptToRateApp {
    NSLog(@"iRate did rate app");
}

- (void)iRateUserDidDeclineToRateApp {
    NSLog(@"iRate did receive rating declination");
}

- (void)iRateUserDidRequestReminderToRateApp {
    NSLog(@"iRate did receive req for reminder");
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [iRate sharedInstance].delegate = self;
    return YES;
}

@end
