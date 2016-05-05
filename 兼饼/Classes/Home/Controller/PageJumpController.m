//
//  PageJumpController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/11/4.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "PageJumpController.h"
#import "MBProgressHUD+MJ.h"

@interface PageJumpController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation PageJumpController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置回退按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"upBack" highImage:@"upBack"];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.pageUrl]];
    [MBProgressHUD showMessage:@"页面载入中"];
    [self.webview loadRequest:request];
    [MBProgressHUD hideHUD];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
