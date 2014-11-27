//
//  CommentTableViewCell.h
//  FlashCache
//
//  Created by 藤池 匡史 on 11/28/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonMethods.h"

@interface CommentTableViewCell : UITableViewCell{
    UIImageView *userImage;
    UILabel *userName;
    UILabel *userComment;
}

@property (nonatomic,retain) UIImageView *userImage;
@property (nonatomic,retain) UILabel *userName;
@property (nonatomic,retain) UILabel *userComment;

@end
