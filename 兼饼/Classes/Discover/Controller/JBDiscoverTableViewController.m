//
//  JBDiscoverTableViewController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/9.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBDiscoverTableViewController.h"

@interface JBDiscoverTableViewController ()

@end

@implementation JBDiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //右边
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(right) image:@"搜索" highImage:@"搜索"];
}

-(void)right
{
    NSLog(@"bbbbb----");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"disCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section==0) {
        cell.imageView.image=[UIImage imageNamed:@"商"];
        cell.textLabel.text=@"商家动态";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.section==1){
        cell.imageView.image=[UIImage imageNamed:@"saoyisao"];
        cell.textLabel.text=@"报告、签到扫一扫";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.imageView.image=[UIImage imageNamed:@"tuijian"];
        cell.textLabel.text=@"推荐给好友";
    }
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}



@end
