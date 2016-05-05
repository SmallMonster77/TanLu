//
//  JBHomeTableViewController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/9.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBHomeTableViewController.h"
#import "JBScrollCell.h"
#import "JBListCell.h"
#import "JBInfoCell.h"
#import "JBHomeGroup.h"
#import "JBScrollModel.h"
#import "JBInfoModel.h"
#import "JBListModel.h"
#import "JBDetailsController.h"
#import "SearchController.h"
#import "PageJumpController.h"

@interface JBHomeTableViewController ()<JBScrollCellDelegate,JBListCellDelegate>

//scrollData
@property(nonatomic,strong) NSMutableArray *scrollData;
//ListData
@property(nonatomic,strong) NSMutableArray *listData;
//InfoData
@property(nonatomic,strong) NSMutableArray *infoData;
//page
@property(nonatomic,assign) int page;

@end

@implementation JBHomeTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.page=1;
    //设置导航栏
    [self setNav];
    
    //添加下拉刷新
    [self addRefresh];
    //添加上拉刷新
    [self addFooterRefresh];
    //网络请求
   // [self getScrollDataWithUserid:nil token:nil la:@"31.86694" lo:@"117.2827"];

}
-(void)addFooterRefresh
{
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    
}


-(void)addRefresh
{
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //进入刷新状态调用这个block
        [self startRefresh];
    }];

    //立即进入刷新状态
    [self.tableView.header beginRefreshing];

}

-(void)loadMoreData
{
    //加载更多数据
    [self getInfoDataWithUserid:nil token:nil la:@"31.85925" lo:@"117.216" settlecircleid:nil jobtypeid:nil page:[NSString stringWithFormat:@"%d",++self.page] size:@"20"];
    [self.tableView.footer endRefreshing];
}

-(void)startRefresh
{
    [self getScrollDataWithUserid:nil token:nil la:@"31.85925" lo:@"117.216"];
    [self getListDataWithUserid:nil token:nil la:@"31.85925" lo:@"117.216"];
    [self getInfoDataWithUserid:nil token:nil la:@"31.85925" lo:@"117.216" settlecircleid:nil jobtypeid:nil page:@"1" size:@"20"];
    
    [self.tableView.header endRefreshing];
}

//设置导航栏，不显示滚动条，
-(void)setNav
{
    //设置左边的barButtonItem
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"firstDown"] forState:UIControlStateNormal];
    [leftBtn setTitle:@"湖南省" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    leftBtn.frame=CGRectMake(0, 0, 70, 30);
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 53, 0, 0)];
    [leftBtn addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    //右边
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(right) image:@"搜索" highImage:@"搜索"];
    //不显示滚动条
   // self.tableView.showsVerticalScrollIndicator=NO;
//    //设置cell的分割线
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
//    {
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
//    {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
}


//获取info数据
-(void)getInfoDataWithUserid:(NSString *)userid token:(NSString *)token la:(NSString *)la lo:(NSString *)lo settlecircleid:(NSString *)settlecircleid jobtypeid:(NSString *)jobtypeid page:(NSString *)page size:(NSString *)size
{
    if ([page isEqualToString:@"1"]) {
       // NSIndexSet *set=[[NSIndexSet alloc] initWithIndex:2];
       // [self.tableView deleteSections:set withRowAnimation:UITableViewRowAnimationNone];
        
        self.infoData=[NSMutableArray array];
        [self.tableView reloadData];
    }
    //self.infoData=[NSMutableArray array];
    //使用AFN获取网络数据
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //构造参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"userid"]=userid;
    params[@"token"]=token;
    params[@"data"]=[NSString stringWithFormat:@"{\"la\" : \"%@\",\"lo\" : \"%@\",\"page\" : %@,\"size\" : \"%@\"}",la,lo,page,size];
    //请求url
    NSString *url=@"http://capp.tanlu.cc/v120/job/listByHome";
    //开始请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSArray *data=responseObject[@"jobs"];
        for (NSDictionary *dict in data) {
            JBInfoModel *temp=[JBInfoModel objectWithKeyValues:dict];
            [self.infoData addObject:temp];
        }
        if ([page isEqualToString:@"1"]) {
            NSIndexSet *set=[[NSIndexSet alloc] initWithIndex:2];
            [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
        }else{
            [self.tableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
    }];

}

//获取list数据
-(void)getListDataWithUserid:(NSString *)userid token:(NSString *)token la:(NSString *)la lo:(NSString *)lo
{
    self.listData=[NSMutableArray array];
    //使用AFN获取网络数据
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //构造参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"userid"]=userid;
    params[@"token"]=token;
    params[@"data"]=[NSString stringWithFormat:@"{\"la\" : \"%@\",\"lo\" : \"%@\"}",la,lo];
    //请求url
    NSString *url=@"http://capp.tanlu.cc/v120/index/themes";
    //开始请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSArray *data=responseObject[@"themes"];
        for (NSDictionary *dict in data) {
            JBListModel *temp=[JBListModel objectWithKeyValues:dict];
            [self.listData addObject:temp];
        }
        NSIndexSet *set=[[NSIndexSet alloc] initWithIndex:1];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
    }];

}

//获取滚动条的数据
-(void)getScrollDataWithUserid:(NSString *)userid token:(NSString *)token la:(NSString *)la lo:(NSString *)lo
{
    //初始化数组
    self.scrollData=[NSMutableArray array];
    //使用AFN获取网络数据
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //构造参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"userid"]=userid;
    params[@"token"]=token;
    params[@"data"]=[NSString stringWithFormat:@"{\"la\" : \"%@\",\"lo\" : \"%@\"}",la,lo];
    //请求url
    NSString *url=@"http://capp.tanlu.cc/v120/index/banners";
    //开始请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        NSArray *data=responseObject[@"banners"];
        for (NSDictionary *dict in data) {
            JBScrollModel *temp=[JBScrollModel objectWithKeyValues:dict];
            [self.scrollData addObject:temp];
        }
        NSIndexSet *set=[[NSIndexSet alloc] initWithIndex:0];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
    }];
}

-(void)left
{
    NSLog(@"aaaa---");
}

-(void)right
{
    SearchController *vc=[[SearchController alloc] initWithStyle:UITableViewStyleGrouped];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section==0) {
        return 1;
    }else if(section==1){
        return 1;
    }else{
        return self.infoData.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        //顶部的cell
        JBScrollCell *cell=[JBScrollCell initWithTableView:tableView];
        cell.dataArray=self.scrollData;
        cell.delegate=self;
        //开始滚动
        //[cell start];
        return cell;
        
    }else if (indexPath.section==1){
        //中间的cell
        JBListCell *cell=[JBListCell initWithTableView:tableView];
        cell.delegate=self;
        cell.dataArray=self.listData;
        return cell;
        
    }else{
        //内容的cell
        JBInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Info_Cell"];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"JBInfoCell" owner:nil options:nil] firstObject];
        }
        if (self.infoData.count>indexPath.row&&self.infoData.count>0) {
            cell.data=self.infoData[indexPath.row];
        }
        
        return cell;
    }
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
//    {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
//    {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    
//}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 130;
    }else if(indexPath.section==1){
        return 80;
    }
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 10;
    }
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JBDetailsController *vc=[[JBDetailsController alloc] init];
    vc.title=@"职位详情";
    //传入参数
    JBInfoModel *data=[self.infoData objectAtIndex:indexPath.row];
    vc.job_id=data.ID;
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

//scroll的代理方法
-(void)pageJump:(JBScrollCell *)cell pageUrl:(NSString *)pageUrl
{
    PageJumpController *vc=[[PageJumpController alloc] init];
    vc.hidesBottomBarWhenPushed=YES;
    vc.pageUrl=pageUrl;
    vc.title=@"详情页";
    [self.navigationController pushViewController:vc animated:YES];
}
//listBtn代理方式
-(void)btnJump:(JBListCell *)btnCell withUrl:(NSString *)url
{
    PageJumpController *vc=[[PageJumpController alloc] init];
    vc.hidesBottomBarWhenPushed=YES;
    vc.pageUrl=url;
    vc.title=@"详情";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
