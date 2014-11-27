//
//  AppDelegate.m
//  FlashCache
//
//  Created by 藤池 匡史 on 11/21/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect bounds = [[UIScreen mainScreen]bounds];
    window = [[UIWindow alloc]initWithFrame:bounds];
    
#pragma mark - TabBarController & NavigationBarController Settings
    
    //rootControllerの作成
    rootController_ = [[UITabBarController alloc]init];
    
    //各VCをタブに格納
    AddVC* tab1 = [[AddVC alloc]init];
    FeedVC* tab2 = [[FeedVC alloc]init];
    ProfileVC* tab3 = [[ProfileVC alloc]init];
    NotificationVC* tab4 = [[NotificationVC alloc]init];
    
    //NavigationBar用のcontroller格納先
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    //各tabをNavigationControllerにセット
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:tab1];
    [viewControllers addObject:nav1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:tab2];
    [viewControllers addObject:nav2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:tab3];
    [viewControllers addObject:nav3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:tab4];
    [viewControllers addObject:nav4];
    //viewControllersに各ViewControllerを追加
    NSArray* controllers = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nil];
    
    //NavigationBar Designs
    [UINavigationBar appearance].barTintColor = mainColor;
    //[UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    //[UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    // タブバーのタイトルを設定
    
    tab1.title = @"Add";
    tab2.title = @"Feed";
    tab3.title = @"Profile";
    tab4.title = @"Notification";
    
    // タブバーのアイコンを設定
    
    UIImage* icon1_before = [UIImage imageNamed:@"add_before.png"];
    UIImage* icon2_before = [UIImage imageNamed:@"feed_before.png"];
    UIImage* icon3_before = [UIImage imageNamed:@"profile_before.png"];
    UIImage* icon4_before = [UIImage imageNamed:@"notification_before.png"];
    
    UIImage* icon1_after = [UIImage imageNamed:@"add_after.png"];
    UIImage* icon2_after = [UIImage imageNamed:@"feed_after.png"];
    UIImage* icon3_after = [UIImage imageNamed:@"profile_after.png"];
    UIImage* icon4_after = [UIImage imageNamed:@"notification_after.png"];
    
    tab1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Add"
                                                    image:[icon1_before imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                            selectedImage:[icon1_after imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tab2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Feed"
                                                    image:[icon2_before imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                            selectedImage:[icon2_after imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tab3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Profile"
                                                    image:[icon3_before imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                            selectedImage:[icon3_after imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tab4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Notification"
                                                    image:[icon4_before imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                            selectedImage:[icon4_after imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    //タブ選択時のフォントとカラー
    UIFont *font = navBarFont;
    NSDictionary *selectedAttributes = @{NSFontAttributeName : font,
                                         NSForegroundColorAttributeName : mainColor};
    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes
                                             forState:UIControlStateSelected];
    
    //TabBar設置
    [(UITabBarController*)rootController_ setViewControllers:controllers animated:NO];
    rootController_.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    [self.window setRootViewController: rootController_];
    
    //Make Window Visible
    [self.window makeKeyAndVisible];
    
    return YES;
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
