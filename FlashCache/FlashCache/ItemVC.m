//
//  ItemVC.m
//  FlashCache
//
//  Created by 藤池 匡史 on 11/27/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#define framewidth self.view.frame.size.width

#import "ItemVC.h"

@interface ItemVC ()

@end

@implementation ItemVC

@synthesize collectionView = _containerView;
@synthesize flowLayout = _flowLayout;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [NSString stringWithFormat:@"Item Detail"];

    //テーブルサイズを初期化
    NSInteger tableItemHeight = 98;
    NSInteger tableItmeNumber = 3;
    NSInteger tableHeight = tableItemHeight * tableItmeNumber;
    CGRect tableFrame = CGRectMake(0, 740, framewidth, tableHeight);

    //UIScrollViewの生成
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.bounces = YES;
    
    //テーブルサイズをもとにUIScrolloViewの中身のサイズを計算
    NSInteger pageHeight = 944+tableHeight;
    wrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, framewidth, pageHeight)];
    wrapper.backgroundColor = [UIColor whiteColor];
    
    [self createCollectionView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 258, framewidth-20, 40)];
    titleLabel.text = @"I want MacBookAir 15inch Retina";
    titleLabel.font = titleFont;
    [wrapper addSubview:titleLabel];
    
    UILabel *leftTime = [[UILabel alloc]initWithFrame:CGRectMake(0, 294, framewidth, 30)];
    leftTime.font = baseFont;
    leftTime.text = @"Time Left: 1h31m20s";
    leftTime.textAlignment = NSTextAlignmentCenter;
    [wrapper addSubview:leftTime];
    
    UIView *leftTimeMeter = [[UIView alloc] initWithFrame:CGRectMake(10, 332, framewidth-20, 10)];
    leftTimeMeter.layer.borderColor = bgColor.CGColor;
    leftTimeMeter.layer.borderWidth = 1.0;
    [wrapper addSubview:leftTimeMeter];
    UIView *leftTimeCurrent = [[UIView alloc] initWithFrame:CGRectMake(10, 332, framewidth-150, 10)];
    leftTimeCurrent.backgroundColor = accentColor2;
    [wrapper addSubview:leftTimeCurrent];
    
    UILabel *currentBid = [[UILabel alloc]initWithFrame:CGRectMake(0, 352, framewidth, 30)];
    currentBid.font = baseFont;
    currentBid.text = @"Current Bid: $45";
    currentBid.textAlignment = NSTextAlignmentCenter;
    [wrapper addSubview:currentBid];
    
    UIButton *bidBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [bidBtn setTitle:@"Bid"
            forState:UIControlStateNormal];
    [bidBtn addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [bidBtn.titleLabel setFont:bigFont];
    bidBtn.frame = CGRectMake(framewidth/2-60, 420, 120, 30);
    bidBtn.tintColor = [UIColor whiteColor];
    bidBtn.backgroundColor = accentColor;
    bidBtn.layer.cornerRadius = 4;
    bidBtn.clipsToBounds = YES;
    [wrapper addSubview:bidBtn];

    UIButton *descBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [descBtn setTitle:@"Description"
            forState:UIControlStateNormal];
    [descBtn addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [descBtn.titleLabel setFont:titleFont];
    descBtn.frame = CGRectMake(framewidth/2-120, 460, 120, 20);
    descBtn.tintColor = [UIColor blackColor];
    descBtn.backgroundColor = bgColor;
    UIBezierPath *descBtnMaskPath;
    descBtnMaskPath = [UIBezierPath bezierPathWithRoundedRect:descBtn.bounds
                                            byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
                                                  cornerRadii:CGSizeMake(4.0, 4.0)];
    CAShapeLayer *descBtnMaskLayer = [[CAShapeLayer alloc] init];
    descBtnMaskLayer.frame = self.view.bounds;
    descBtnMaskLayer.path = descBtnMaskPath.CGPath;
    descBtn.layer.mask = descBtnMaskLayer;
    descBtn.clipsToBounds = YES;
    [wrapper addSubview:descBtn];

    UIButton *shipBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [shipBtn setTitle:@"Shipment"
             forState:UIControlStateNormal];
    [shipBtn addTarget:self
                action:@selector(button_Tapped:)
      forControlEvents:UIControlEventTouchUpInside];
    [shipBtn.titleLabel setFont:titleFont];
    shipBtn.frame = CGRectMake(framewidth/2, 460, 120, 20);
    shipBtn.tintColor = [UIColor blackColor];
    shipBtn.backgroundColor = bgColor;
    UIBezierPath *shipBtnMaskPath;
    shipBtnMaskPath = [UIBezierPath bezierPathWithRoundedRect:shipBtn.bounds
                                            byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
                                                  cornerRadii:CGSizeMake(4.0, 4.0)];
    CAShapeLayer *shipBtnMaskLayer = [[CAShapeLayer alloc] init];
    shipBtnMaskLayer.frame = self.view.bounds;
    shipBtnMaskLayer.path = shipBtnMaskPath.CGPath;
    shipBtn.layer.mask = shipBtnMaskLayer;
    shipBtn.clipsToBounds = YES;
    [wrapper addSubview:shipBtn];
    
    UIView *borderOut = [[UIView alloc]initWithFrame:CGRectMake(framewidth/2-120, 460, 240, 20)];
    borderOut.layer.borderColor = subColor.CGColor;
    borderOut.layer.borderWidth = 1.0;
    borderOut.layer.cornerRadius = 4;
    [wrapper addSubview:borderOut];
    
    UIView *borderIn = [[UIView alloc]initWithFrame:CGRectMake(framewidth/2, 460, 2, 20)];
    borderIn.backgroundColor = subColor;
    [wrapper addSubview:borderIn];

    UILabel *category = [[UILabel alloc]initWithFrame:CGRectMake(20, 490, framewidth-40, 20)];
    category.font = baseFont;
    category.text = @"Category:-----------";
    [wrapper addSubview:category];
    
    UILabel *brand = [[UILabel alloc]initWithFrame:CGRectMake(20, 510, framewidth-40, 20)];
    brand.font = baseFont;
    brand.text = @"Brand:-----------";
    [wrapper addSubview:brand];

    UILabel *modelNumber = [[UILabel alloc]initWithFrame:CGRectMake(20, 530, framewidth-40, 20)];
    modelNumber.font = baseFont;
    modelNumber.text = @"ModelNumber:-----------";
    [wrapper addSubview:modelNumber];
    
    UILabel *condition = [[UILabel alloc]initWithFrame:CGRectMake(20, 550, framewidth-40, 20)];
    condition.font = baseFont;
    condition.text = @"Condition:-----------";
    [wrapper addSubview:condition];

    UILabel *accessories = [[UILabel alloc]initWithFrame:CGRectMake(20, 570, framewidth-40, 20)];
    accessories.font = baseFont;
    accessories.text = @"Accessories:-----------";
    [wrapper addSubview:accessories];
    
    UILabel *description = [[UILabel alloc]initWithFrame:CGRectMake(20, 590, framewidth-40, 20)];
    description.font = baseFont;
    description.text = @"Description:-----------";
    [wrapper addSubview:description];

    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 660, framewidth, 20)];
    border.backgroundColor = bgColor;
    [wrapper addSubview:border];

    UILabel *commentsHeader = [[UILabel alloc]initWithFrame:CGRectMake(0, 680, framewidth, 30)];
    commentsHeader.font = titleFont;
    commentsHeader.text = @"  Comments";
    commentsHeader.backgroundColor = subColor;
    [wrapper addSubview:commentsHeader];

    UILabel *previousComments = [[UILabel alloc]initWithFrame:CGRectMake(0, 710, framewidth, 26)];
    previousComments.font = baseFont;
    previousComments.text = @"  View previous comments...";
    [wrapper addSubview:previousComments];    
    
    UIView *borderBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 736, framewidth, 1)];
    borderBottom.backgroundColor = bgColor;
    [wrapper addSubview:borderBottom];
    
    tableView_ = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    [wrapper addSubview:tableView_];
    
    tableView_.delegate = self;
    tableView_.dataSource = self;
    
    [tableView_ registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"MyIdentifier"];
    
    UIButton *sendComment = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendComment setTitle:@"Send"
            forState:UIControlStateNormal];
    [sendComment addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [sendComment.titleLabel setFont:baseFont];
    sendComment.frame = CGRectMake(framewidth-80, 748+tableHeight, 60, 24);
    sendComment.tintColor = [UIColor whiteColor];
    sendComment.backgroundColor = accentColor;
    sendComment.layer.cornerRadius = 4;
    sendComment.clipsToBounds = YES;
    [wrapper addSubview:sendComment];
    
    // UITextFieldのインスタンスを生成
    UITextField *commentTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 748+tableHeight, framewidth-120, 24)];
    commentTextField.borderStyle = UITextBorderStyleRoundedRect;
    commentTextField.textAlignment = NSTextAlignmentLeft;
    commentTextField.font = baseFont;
    commentTextField.placeholder = @"Write a comment...";
    commentTextField.keyboardType = UIKeyboardTypeDefault;
    commentTextField.returnKeyType = UIReturnKeyDefault;
    commentTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    commentTextField.delegate = self;
    commentTextField.backgroundColor = bgColor;
    [wrapper addSubview:commentTextField];
    
    UIView *border2 = [[UIView alloc]initWithFrame:CGRectMake(0, 780+tableHeight, framewidth, 20)];
    border2.backgroundColor = bgColor;
    [wrapper addSubview:border2];
    
    UILabel *sellerHeader = [[UILabel alloc]initWithFrame:CGRectMake(0, 800+tableHeight, framewidth, 30)];
    sellerHeader.font = titleFont;
    sellerHeader.text = @"  AboutSeller";
    sellerHeader.backgroundColor = subColor;
    [wrapper addSubview:sellerHeader];
    
    UIImageView *profImg = [[UIImageView alloc]initWithFrame:CGRectMake(framewidth/8 - 30, 860+tableHeight, 60, 60)];
    profImg.image = [UIImage imageNamed:@"testimg_prof1_big.png"];
    profImg.layer.cornerRadius = 30;
    profImg.clipsToBounds = YES;
    [wrapper addSubview:profImg];
    
    UILabel *rateNum = [[UILabel alloc]initWithFrame:CGRectMake((framewidth/8)*3 - 16, 840+tableHeight, 30, 30)];
    rateNum.font = bigFont;
    rateNum.text = @"24";
    rateNum.textAlignment = NSTextAlignmentCenter;
    [wrapper addSubview:rateNum];
    
    UILabel *totalRatings = [[UILabel alloc]initWithFrame:CGRectMake((framewidth/8)*3 - 46, 888+tableHeight, 92, 40)];
    totalRatings.font = bigFont;
    totalRatings.numberOfLines = 0;
    totalRatings.text = @"Total\nRatings";
    totalRatings.textAlignment = NSTextAlignmentCenter;
    [wrapper addSubview:totalRatings];
    
    UIView *border3 = [[UIView alloc]initWithFrame:CGRectMake(framewidth/2, 840+tableHeight, 1, 80)];
    border3.backgroundColor =bgColor;
    [wrapper addSubview:border3];

    UILabel *likeNum = [[UILabel alloc]initWithFrame:CGRectMake((framewidth/8)*5 - 16, 840+tableHeight, 30, 30)];
    likeNum.font = bigFont;
    likeNum.text = @"24";
    likeNum.textAlignment = NSTextAlignmentCenter;
    [wrapper addSubview:likeNum];

    UIImageView *likeImg = [[UIImageView alloc]initWithFrame:CGRectMake((framewidth/8)*5 - 16, 888+tableHeight, 32, 32)];
    likeImg.image = [UIImage imageNamed:@"like.png"];
    [wrapper addSubview:likeImg];

    UIView *border4 = [[UIView alloc]initWithFrame:CGRectMake((framewidth/4)*3, 840+tableHeight, 1, 80)];
    border4.backgroundColor =bgColor;
    [wrapper addSubview:border4];
    
    UILabel *dislikeNum = [[UILabel alloc]initWithFrame:CGRectMake((framewidth/8)*7 - 16, 840+tableHeight, 30, 30)];
    dislikeNum.font = bigFont;
    dislikeNum.text = @"24";
    dislikeNum.textAlignment = NSTextAlignmentCenter;
    [wrapper addSubview:dislikeNum];
    
    UIImageView *dislikeImg = [[UIImageView alloc]initWithFrame:CGRectMake((framewidth/8)*7 - 16, 888+tableHeight, 32, 32)];
    dislikeImg.image = [UIImage imageNamed:@"dislike.png"];
    [wrapper addSubview:dislikeImg];
    
    [scrollView addSubview:wrapper];
    scrollView.contentSize = wrapper.bounds.size;
    scrollView.clipsToBounds = YES;
    [self.view addSubview:scrollView];
    [scrollView flashScrollIndicators];
}

#pragma mark - UICollectionView Settings

NSInteger numOfCells = 4;

-(void)createCollectionView
{
    /*UICollectionViewのコンテンツの設定 UICollectionViewFlowLayout*/
    collectionViewCellWidth = framewidth;
    collectionViewCellHeight = 248;
    
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.itemSize = CGSizeMake(collectionViewCellWidth, collectionViewCellHeight);  //表示するアイテムのサイズ
    _flowLayout.minimumLineSpacing = 0;  //セクションとアイテムの間隔
    _flowLayout.minimumInteritemSpacing = 0;  //アイテム同士の間隔
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    CGSize baseSize = CGSizeMake(collectionViewCellWidth*numOfCells, collectionViewCellHeight);
    
    /*UICollectionViewの土台を作成*/
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0/*self.navigationController.navigationBar.bounds.size.height*/, collectionViewCellWidth, collectionViewCellHeight) collectionViewLayout:self.flowLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _collectionView.contentSize = baseSize;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView flashScrollIndicators];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];  //collectionViewにcellのクラスを登録。セルの表示に使う
    _collectionView.pagingEnabled = YES;
    _collectionView.scrollEnabled = YES;
    
    _collectionView.clipsToBounds = NO;
    
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [wrapper addSubview:_collectionView];
}

#pragma mark - UICollectionViewDelegate

/*セクションの数*/
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

/*セクションに応じたセルの数*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return numOfCells;
    }else{
        return 0;
    }
}

#pragma mark - UICollectionViewDataSource

/*セルの内容を返す*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
    }
    if (indexPath.section == 0) {
        // 毎回カスタムセルを生成してるの、頭がおかしい気がしないでもない。そのうちに確認して修正
        if (indexPath.row == 0){
            UIView *customCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            UIImage *image = [UIImage imageNamed:@"testimg1.png"];
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            iv.image = image;
            iv.contentMode = UIViewContentModeScaleAspectFill;
            [customCell addSubview:iv];
            cell.backgroundColor = [UIColor whiteColor];
            [cell.contentView addSubview:customCell];
        }else if (indexPath.row == 1) {
            UIView *customCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            UIImage *image = [UIImage imageNamed:@"testimg2.png"];
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            iv.image = image;
            iv.contentMode = UIViewContentModeScaleAspectFill;
            [customCell addSubview:iv];
            cell.backgroundColor = [UIColor whiteColor];
            [cell.contentView addSubview:customCell];
        }else if (indexPath.row == 2) {
            UIView *customCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            UIImage *image = [UIImage imageNamed:@"testimg3.png"];
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            iv.image = image;
            iv.contentMode = UIViewContentModeScaleAspectFill;
            [customCell addSubview:iv];
            cell.backgroundColor = [UIColor whiteColor];
            [cell.contentView addSubview:customCell];
        }else if (indexPath.row == 3) {
            UIView *customCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            UIImage *image = [UIImage imageNamed:@"testimg1.png"];
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, collectionViewCellWidth, collectionViewCellHeight)];
            iv.image = image;
            iv.contentMode = UIViewContentModeScaleAspectFill;
            [customCell addSubview:iv];
            cell.backgroundColor = [UIColor whiteColor];
            [cell.contentView addSubview:customCell];
        }
    }
    return cell;
}

#pragma mark - tableViewCell Settings

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//return [item_id count];
}

// セル高さを設定

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 98;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    CommentTableViewCell *cell = (CommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
    }
    // Configure cells
    // 仮データ。実際は読み込んだ配列から入力する
    cell.userImage.image = [UIImage imageNamed:@"comment.png"];
    cell.userName.text = @"tai";
    cell.userComment.text = @"Hello, sevensmall!\nI'm very interested in this item.\nHow can I get it?";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //画面遷移にしておく。仮
    UIViewController *next = [[ItemVC alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

#pragma mark - button settings

- (void)button_Tapped:(id)sender
{
    // ここに処理を書く
}

#pragma mark - textfield settings

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // キーボードを隠す
    [self.view endEditing:YES];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
