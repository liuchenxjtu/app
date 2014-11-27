//
//  AppDelegate.h
//  FlashCache
//
//  Created by 藤池 匡史 on 11/21/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllers.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    //rootControllerのインスタンス変数の作成
    UIWindow* window;
    UINavigationController *naviController;
    UIViewController* rootController_;
}

@property (strong, nonatomic) UIWindow *window;


@end

