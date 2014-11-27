//
//  CommentTableViewCell.m
//  FlashCache
//
//  Created by 藤池 匡史 on 11/28/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#define screen [[UIScreen mainScreen] bounds]

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

@synthesize userImage;
@synthesize userName;
@synthesize userComment;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        userImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 4, 30, 30)];
        [self.contentView addSubview:userImage];

        userName = [[UILabel alloc]initWithFrame:CGRectMake(40, 4, screen.size.width - 40, 30)];
        userName.font = bigFont;
        [self.contentView addSubview:userName];
        
        userComment = [[UILabel alloc]initWithFrame:CGRectMake(40, 34, screen.size.width - 40 , 60)];
        userComment.font = baseFont;
        userComment.numberOfLines = 0;
        [self.contentView addSubview:userComment];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
