//
//  AppDelegate.m
//  AnimationText
//
//  Created by 李阳 on 16/4/11.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "AppDelegate.h"

#import "UIImage+Util.h"

#import "HomePageViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "BaseCenterViewController.h"

#import "SWRevealViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self customizeInterface];
    [self setRootViewController2];
    
    // Override point for customization after application launch.
    return YES;
}

//设置导航栏
- (void)customizeInterface {
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat navHeight = 64.0;
    CGSize  imageSize = CGSizeMake(screenWidth, navHeight);
    UIImage *image = [UIImage imageNamed:@"navHead.png"];
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        
        backgroundImage = [UIImage scaleToSize:image size:imageSize];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor whiteColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage scaleToSize:image size:imageSize];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor whiteColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
//    [navigationBarAppearance setBackgroundImage:backgroundImage
//                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setBackgroundColor:[UIColor cyanColor]];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    navigationBarAppearance.tintColor = [UIColor whiteColor];
    
}

- (void)setRootViewController {
    
    UIViewController *rootVC = [[UINavigationController alloc] initWithRootViewController:[HomePageViewController new]];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
}

- (void)setRootViewController2 {
    
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    BaseCenterViewController *centerVC = [[BaseCenterViewController alloc] init];
    RightViewController *rightVC = [[RightViewController alloc] init];
    
    UINavigationController *navcenterVC = [[UINavigationController alloc] initWithRootViewController:centerVC];
    
    SWRevealViewController *revealviewcontroller = [[SWRevealViewController alloc] initWithRearViewController:leftVC frontViewController:navcenterVC];
    revealviewcontroller.rightViewController = rightVC;
    //浮动层离左边距的宽度
    revealviewcontroller.rearViewRevealWidth = 200;
    //是否让浮动层弹回原位
    [revealviewcontroller setFrontViewPosition:FrontViewPositionLeft animated:YES];
    
    self.window.rootViewController = revealviewcontroller;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
