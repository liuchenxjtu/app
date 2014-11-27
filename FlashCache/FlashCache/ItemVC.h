//
//  ItemVC.h
//  FlashCache
//
//  Created by 藤池 匡史 on 11/27/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllers.h"

@interface ItemVC : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    UICollectionViewFlowLayout *_flowLayout;
    UICollectionView *_collectionView;
    
    NSInteger collectionViewCellWidth;
    NSInteger collectionViewCellHeight;

    UITableView *tableView_;
    UIRefreshControl *_refreshControl;

    UIView *wrapper;
}

@property (retain, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (retain, nonatomic) UICollectionView *collectionView;

@property (nonatomic, retain) UITableView *tableView;

@end
