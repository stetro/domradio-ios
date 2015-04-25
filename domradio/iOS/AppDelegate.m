/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "RCTRootView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"domradio"
                                                   launchOptions:launchOptions];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [[UIViewController alloc] init];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  UIColor *domradioColor = [UIColor colorWithRed:0.671 green:0.235 blue:0.176 alpha:1]; /*#ab3c2d*/
  
  [[UINavigationBar appearance] setBarTintColor: domradioColor];
  [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
  
  [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                         NSFontAttributeName : [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:22.0],
                                                         NSForegroundColorAttributeName : [UIColor whiteColor]
                                                         }];
  
  
  return YES;
}

@end
