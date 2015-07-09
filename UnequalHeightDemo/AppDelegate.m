//
//  AppDelegate.m
//  UnequalHeightDemo
//
//  Created by kiwik on 7/9/15.
//  Copyright (c) 2015 Kiwik. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    ViewController *vc=[[ViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController=nav;
    
    return YES;
}


@end
