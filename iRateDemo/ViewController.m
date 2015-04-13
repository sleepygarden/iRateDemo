//
//  ViewController.m
//  iRateDemo
//
//  Created by Michael Cornell on 4/13/15.
//  Copyright (c) 2015 Sleepy. All rights reserved.
//

#import "ViewController.h"
#import "iRate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)forceiRatePrompt:(id)sender {
    //[[iRate sharedInstance] promptForRating];// attempts to open without internet
    [[iRate sharedInstance] promptIfNetworkAvailable];
}
- (IBAction)iRatePrompt:(id)sender {
    [[iRate sharedInstance] promptIfAllCriteriaMet];
}

@end
