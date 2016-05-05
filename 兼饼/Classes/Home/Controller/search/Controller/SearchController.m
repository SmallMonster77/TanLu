//
//  SearchController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/24.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "SearchController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface SearchController ()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource,UISearchBarDelegate>
@property(nonatomic,strong) UISearchBar *search;


@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置回退按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"upBack" highImage:@"upBack"];
    self.tableView.emptyDataSetDelegate=self;
    self.tableView.emptyDataSetSource=self;
    //设置searchbar
    UISearchBar *search=[[UISearchBar alloc] init];
    search.placeholder=@"搜索职位名称";
    search.keyboardType=UIKeyboardTypeDefault;
    search.backgroundImage=[UIImage imageNamed:@"searchBg"];
    search.delegate=self;
    self.search=search;
    //替换titleview为searchbar
    self.navigationItem.titleView=search;
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

//DZ的代理和数据源方法
//图片
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"飞碟"];
}
//文字
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无数据";
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: [UIFont boldSystemFontOfSize:15],
                                 NSForegroundColorAttributeName: [UIColor grayColor]
                                 };
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

//searchbar的代理方法
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    UIButton *btn=[searchBar valueForKey:@"_cancelButton"];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.text = @"";
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = NO;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search clicked");
}

//点击搜索框上的 取消按钮时 调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.search.text = @"";
    [self.search resignFirstResponder];
}


@end
