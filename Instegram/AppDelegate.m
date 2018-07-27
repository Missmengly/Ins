//
//  AppDelegate.m
//  Instegram
//
//  Created by zhtt on 2018/7/2.
//  Copyright © 2018年 ZHTT. All rights reserved.
//

#import "AppDelegate.h"
#import "InsMainViewController.h"
#import "InsNearViewController.h"
#import "InsDynamicDetailsViewController.h"
#import "YHTimeLineListController.h"
#import "InsFollowViewController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface AppDelegate ()
{
    BMKMapManager         *_mapManager;
  }

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];

    
    InsMainViewController * vc = [[InsMainViewController alloc]init];
//    InsNearViewController * vc = [[InsNearViewController alloc]init];
//    InsDynamicDetailsViewController * vc = [[InsDynamicDetailsViewController alloc]init];
//    YHTimeLineListController * vc = [[YHTimeLineListController alloc]init];
//    InsFollowViewController * vc = [[InsFollowViewController alloc]init];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    
    
    _mapManager = [BMKMapManager new];
    BOOL ret = [_mapManager start:@"oDZwAkCQq41fDDdhHeRhYG7jH5Cwtyx8" generalDelegate:nil];
    if (!ret)     {
        NSLog(@"百度地图启动失败");
    } else {
        NSLog(@"百度地图启动成功");
    }
    
 
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  
  
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
