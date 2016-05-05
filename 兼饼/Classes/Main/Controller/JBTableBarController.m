//
//  JBTableBarController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/9.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBTableBarController.h"
#import "JBNavController.h"
#import "JBHomeTableViewController.h"
#import "JBDiscoverTableViewController.h"
#import "JBOwnViewController.h"
#import "JBNearbyViewController.h"

@interface JBTableBarController ()

@end

@implementation JBTableBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //首页
    JBHomeTableViewController *home=[[JBHomeTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self addChildVc:home title:@"首页" image:@"home2" selectedImage:@"home"];
    
    //附近
    JBNearbyViewController *near=[[JBNearbyViewController alloc] init];
    near.view.backgroundColor=[UIColor whiteColor];
    [self addChildVc:near title:@"工作" image:@"near" selectedImage:@"near2"];
    //发现
    JBDiscoverTableViewController *discover=[[JBDiscoverTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self addChildVc:discover title:@"发现" image:@"find" selectedImage:@"find2"];
    //个人
    JBOwnViewController *own=[[JBOwnViewController alloc] init];
   // own.view.backgroundColor=[UIColor whiteColor];
    [self addChildVc:own title:@"我" image:@"my" selectedImage:@"my2"];
    
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    //childVc.title = title; // 同时设置tabbar和navigationBar的文字
        childVc.tabBarItem.title = title; // 设置tabbar的文字
    //    childVc.navigationItem.title = title; // 设置navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = HWColor(0.08*255, 0.68*255, 0.4*255);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    //childVc.view.backgroundColor = HWRandomColor;
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    JBNavController *nav = [[JBNavController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];

}

@end
