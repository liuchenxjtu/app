//
//  FeedTableViewCell.m
//  FlashCache
//
//  Created by 藤池 匡史 on 11/27/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#define screen [[UIScreen mainScreen] bounds]

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

@synthesize itemNameLabel;
@synthesize restingTimeLabel;
@synthesize rateLabel;
@synthesize bidCountLabel;
@synthesize browseCountLabel;
@synthesize commentCountLabel;
@synthesize favoriteCountLavel;
@synthesize tag;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = bgColor;
        UIView *imgBox = [[UIView alloc]initWithFrame:CGRectMake(10, 10, screen.size.width-20, 240)];
        imgBox.backgroundColor = [UIColor whiteColor];
        imgBox.layer.cornerRadius = 4;
        [self.contentView addSubview:imgBox];

        //各要素を左上から順に配置してある
        itemNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, screen.size.width-28, 40)];
        itemNameLabel.font = titleFont;
        itemNameLabel.numberOfLines = 0;
        [self.contentView addSubview:itemNameLabel];
        
        UIImageView *restingTimeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(20, 50, 30, 30)];
        restingTimeIcon.image = [UIImage imageNamed:@"restingTime.png"];
        [self.contentView addSubview:restingTimeIcon];
        restingTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 54, screen.size.width-58, 20)];
        restingTimeLabel.font = baseFont;
        [self.contentView addSubview:restingTimeLabel];
        
        rateLabel = [[UILabel alloc]initWithFrame:CGRectMake(screen.size.width-80, 54, 80, 20)];
        rateLabel.font = baseFont;
        [self.contentView addSubview:rateLabel];
        
        //アイテムの画像を表示
        // UIClloctionViewがバグるのでひとまずUIScrollViewを使う
        // 中にUIViewControllerあたりを入れ込む形にすると管理が楽そう
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(6, 84, screen.size.width-6, 148)];
        scrollView.bounces = YES;
        UIView *wrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 620, 148)];
        wrapper.backgroundColor = [UIColor whiteColor];

        //テスト
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 148)];
        img1.image = [UIImage imageNamed:@"testimg1.png"];
        [wrapper addSubview:img1];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(210, 0, 200, 148)];
        img2.image = [UIImage imageNamed:@"testimg2.png"];
        [wrapper addSubview:img2];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(420, 0, 200, 148)];
        img3.image = [UIImage imageNamed:@"testimg3.png"];
        [wrapper addSubview:img3];
        
        [scrollView addSubview:wrapper];
        scrollView.contentSize = wrapper.bounds.size;
        scrollView.clipsToBounds = YES;
        [self.contentView addSubview:scrollView];
        [scrollView flashScrollIndicators];
        
        UIImageView *bidIcon = [[UIImageView alloc]initWithFrame:CGRectMake(30, 260, 30, 30)];
        bidIcon.image = [UIImage imageNamed:@"bid.png"];
        [self.contentView addSubview:bidIcon];
        bidCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 264, 40, 20)];
        bidCountLabel.font = baseFont;
        [self.contentView addSubview:bidCountLabel];
        
        UIImageView *browseIcon = [[UIImageView alloc]initWithFrame:CGRectMake((screen.size.width/4)+20, 260, 30, 30)];
        browseIcon.image = [UIImage imageNamed:@"browse.png"];
        [self.contentView addSubview:browseIcon];
        browseCountLabel = [[UILabel alloc]initWithFrame:CGRectMake((screen.size.width/4)+60, 264, 40, 20)];
        browseCountLabel.font = baseFont;
        [self.contentView addSubview:browseCountLabel];
        
        UIImageView *commentIcon = [[UIImageView alloc]initWithFrame:CGRectMake((screen.size.width/4)*2+20, 260, 30, 30)];
        commentIcon.image = [UIImage imageNamed:@"comment.png"];
        [self.contentView addSubview:commentIcon];
        commentCountLabel = [[UILabel alloc]initWithFrame:CGRectMake((screen.size.width/4)*2+60, 264, 40, 20)];
        commentCountLabel.font = baseFont;
        [self.contentView addSubview:commentCountLabel];
        
        UIImageView *favoriteIcon = [[UIImageView alloc]initWithFrame:CGRectMake((screen.size.width/4)*3+10, 260, 30, 30)];
        favoriteIcon.image = [UIImage imageNamed:@"favorite.png"];
        [self.contentView addSubview:favoriteIcon];
        favoriteCountLavel = [[UILabel alloc]initWithFrame:CGRectMake((screen.size.width/4)*3+50, 264, 40, 20)];
        favoriteCountLavel.font = baseFont;
        [self.contentView addSubview:favoriteCountLavel];
        
        tag = [[UILabel alloc]initWithFrame:CGRectMake(20, 296, 40, 16)];
        tag.backgroundColor = [UIColor whiteColor];
        tag.textColor = accentColor;
        tag.font = tagFont;
        tag.textAlignment = NSTextAlignmentCenter;
        tag.layer.cornerRadius = 8;
        tag.clipsToBounds = YES;
        tag.layer.borderColor = subColor.CGColor;
        tag.layer.borderWidth = 1.0;
        [self.contentView addSubview:tag];
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
