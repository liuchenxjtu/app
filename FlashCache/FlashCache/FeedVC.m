//
//  FeedVC.m
//  FlashCache
//
//  Created by 藤池 匡史 on 11/27/14.
//  Copyright (c) 2014 MasashiFujiike. All rights reserved.
//

#import "FeedVC.h"

@interface FeedVC ()

@end

@implementation FeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    tableView_ = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView_];
    
    tableView_.delegate = self;
    tableView_.dataSource = self;
    
    [tableView_ registerClass:[FeedTableViewCell class] forCellReuseIdentifier:@"MyIdentifier"];
}

#pragma mark - tableViewCell Settings

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;//return [item_id count];
}

// セル高さを設定

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    FeedTableViewCell *cell = (FeedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[FeedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
    }
    // Configure cells
    // 仮データ。実際は読み込んだ配列から入力する
    cell.itemNameLabel.text = @"itemname";
    cell.restingTimeLabel.text = @"2h 10min 50sec";
    cell.rateLabel.text = @"$300";
    cell.bidCountLabel.text = @"3";
    cell.browseCountLabel.text = @"10k";
    cell.commentCountLabel.text = @"1";
    cell.favoriteCountLavel.text = @"5";
    cell.tag.text = @"tag";

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //画面遷移にしておく。仮
    UIViewController *next = [[ItemVC alloc] init];
    [self.navigationController pushViewController:next animated:YES];
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
