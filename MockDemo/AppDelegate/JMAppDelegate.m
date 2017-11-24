//
//  JMAppDelegate.m
//  YYKitDemo
//
//  Created by jama on 2017/11/24.
//  Copyright © 2017年 jama. All rights reserved.
//

#import "JMAppDelegate.h"
#import "YYRootViewController.h"
#import "JMRootViewController.h" // mock


@implementation JMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JMRootViewController *rootVc = JMRootViewController.new;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVc];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
