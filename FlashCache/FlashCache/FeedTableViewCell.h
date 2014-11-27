//
//  FeedTableViewCell.h
//  FlashCache
//
//  Created by 藤池 匡史 on 11/27/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMethods.h"

@interface FeedTableViewCell : UITableViewCell{
    UILabel *itemNameLabel;
    UILabel *restingTimeLabel;
    UILabel *rateLabel;
    UILabel *bidCountLabel;
    UILabel *browseCountLabel;
    UILabel *commentCountLabel;
    UILabel *favoriteCountLavel;
    UILabel *tag;
}

@property (nonatomic,retain) UILabel *itemNameLabel;
@property (nonatomic,retain) UILabel *restingTimeLabel;
@property (nonatomic,retain) UILabel *rateLabel;
@property (nonatomic,retain) UILabel *bidCountLabel;
@property (nonatomic,retain) UILabel *browseCountLabel;
@property (nonatomic,retain) UILabel *commentCountLabel;
@property (nonatomic,retain) UILabel *favoriteCountLavel;
@property (nonatomic,retain) UILabel *tag;

@end
