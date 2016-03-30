//
//  AppDelegate.m
//  Touch_3D
//
//  Created by yumingming on 16/3/22.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TestTouchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    TestTouchViewController * rootVC = [[TestTouchViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController= nav;
    [self.window makeKeyAndVisible];
    [self addMainTest];
    return YES;
}

-(void)addMainTest{

    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay];
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"playItem" localizedTitle:@"play" localizedSubtitle:@"打开" icon:icon1 userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"shareItem" localizedTitle:@"share" localizedSubtitle:@"分享" icon:icon2 userInfo:nil];
    [UIApplication sharedApplication].shortcutItems = @[item1,item2];
}


//菜单跳转
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    //方式two - type
    if ([shortcutItem.type isEqualToString:@"playItem"]) {

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"讨厌" message:@"！！！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        TestTouchViewController *fvc = [[TestTouchViewController alloc] init];
        [self.window.rootViewController showViewController:fvc sender:nil];
    }
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
