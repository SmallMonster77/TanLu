//
//  LoginController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/22.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "LoginController.h"
#import "LoginPage.h"
#import "JBAccount.h"
#import "JBAccountTool.h"
#import "MBProgressHUD+MJ.h"

@interface LoginController ()<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *account;
@property(nonatomic,strong) UITextField *password;
@property(nonatomic,strong) UIButton *loginButton;
@property(nonatomic,strong) LoginPage *background;

@end

@implementation LoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置回退按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"upBack" highImage:@"upBack"];
    //登录界面
    UIImageView *imgview=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo1"]];
    imgview.center=CGPointMake(self.view.size.width*0.5, 160);
    [self.view addSubview:imgview];
    self.view.backgroundColor=[UIColor whiteColor];
    _background=[[LoginPage alloc] initWithFrame:CGRectMake(20, 260, self.view.frame.size.width-40, 100)];
    [_background setBackgroundColor:[UIColor whiteColor]];
    [[_background layer] setCornerRadius:5];
    [[_background layer] setBorderColor:HWColor(0.32*255, 0.74*255, 0.54*255).CGColor];
    [[_background layer] setBorderWidth:1];
    [[_background layer] setMasksToBounds:YES];
    [self.view addSubview:_background];
    _account=[[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, 50)];
    [_account setBackgroundColor:[UIColor clearColor]];
    _account.placeholder=[NSString stringWithFormat:@"请输入手机号"];
    _account.layer.cornerRadius=5.0;
    [_background addSubview:_account];
    _password=[[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-40, 50)];
    [_account setBackgroundColor:[UIColor clearColor]];
    _password.placeholder=[NSString stringWithFormat:@"请输入登录密码"];
    _password.layer.cornerRadius=5.0;
    _password.secureTextEntry=YES;
    [_background addSubview:_password];
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(20, 380, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:HWColor(0.32*255, 0.74*255, 0.54*255)];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    _account.delegate=self;
    _password.delegate=self;
    _account.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)login
{
    if (_account.text.length==0) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入手机号" preferredStyle:UIAlertControllerStyleAlert];
        //创建一个action
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else if (_password.text.length==0){
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        //创建一个action
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        //进行网络验证
        [MBProgressHUD showMessage:@"正在登录"];
        //使用AFN获取网络数据
        AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
        //构造参数
        NSMutableDictionary *params=[NSMutableDictionary dictionary];
        params[@"data"]=[NSString stringWithFormat:@"{\"uname\":\"%@\",\"pw\":\"%@\"}",_account.text,_password.text];
        //请求url
        NSString *url=@"http://capp.tanlu.cc/v120/user/login";
        //开始请求
        [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //请求成功
            NSDictionary *dict=responseObject;
            if ([dict[@"msg"] isEqualToString:@"操作成功"]) {
                JBAccount *account=[JBAccount objectWithKeyValues:dict];
                [JBAccountTool saveAccount:account];
                [MBProgressHUD showSuccess:@"登录成功"];
                [MBProgressHUD hideHUD];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [MBProgressHUD showError:@"登录失败，检查您的密码"];
                [MBProgressHUD hideHUD];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //请求失败
        }];
        [MBProgressHUD hideHUD];
    }
}

@end
