//
//  FeedVC.h
//  FlashCache
//
//  Created by 藤池 匡史 on 11/27/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllers.h"

@interface FeedVC : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView_;
    UIRefreshControl *_refreshControl;
}

@property (nonatomic, retain) UITableView *tableView;

@end
