//
//  JBNavController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/9.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBNavController.h"

@interface JBNavController ()

@end

@implementation JBNavController

+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UINavigationBar *item = [UINavigationBar appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(0.32*255, 0.74*255, 0.54*255);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
