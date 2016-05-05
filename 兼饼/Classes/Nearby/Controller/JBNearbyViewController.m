//
//  JBNearbyViewController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/11.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBNearbyViewController.h"
#import "DOPDropDownMenu.h"
#import "JBNearbyTableViewController.h"

@interface JBNearbyViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>

@property(nonatomic,strong) NSArray *jobs;
@property(nonatomic,strong) NSArray *methods;
@property(nonatomic,strong) NSArray *distance;

@property(nonatomic,weak) DOPDropDownMenu *menu;
@property(nonatomic,strong) JBNearbyTableViewController *near;

@end

@implementation JBNearbyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.jobs=@[@"全部职位",@"演员",@"推广",@"调研",@"司仪",@"礼仪",@"家教",@"充场",@"服务员",@"校校园代理",@"单页派发",@"促销/导购",@"客服",@"快递/物流",@"钟点工",@"实习生",@"保安",@"其他"];
    self.methods=@[@"不限",@"日结",@"周结",@"月结",@"完工结算"];
    self.distance=@[@"5km",@"3km",@"2km",@"1km"];
    // 添加下拉菜单
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:40];
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    _menu = menu;
    [menu selectDefalutIndexPath];
    //添加下面的tabview
    JBNearbyTableViewController *near=[[JBNearbyTableViewController alloc] init];
    CGFloat x=0;
    CGFloat y=104;
    CGFloat w=self.view.bounds.size.width;
    CGFloat h=self.view.bounds.size.height-104-49;
    near.view.frame=CGRectMake(x, y, w, h);
    _near=near;
    [self.view addSubview:near.view];
}



//实现代理方法
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.jobs.count;
    }else if (column == 1){
        return self.methods.count;
    }else {
        return self.distance.count;
    }
}
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.jobs[indexPath.row];
    } else if (indexPath.column == 1){
        return self.methods[indexPath.row];
    } else {
        return self.distance[indexPath.row];
    }
}
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}



@end
