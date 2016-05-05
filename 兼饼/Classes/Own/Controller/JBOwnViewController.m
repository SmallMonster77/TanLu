//
//  JBOwnViewController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/11.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBOwnViewController.h"
#import "JBAccountTool.h"
#import "JBAccount.h"
#import "LoginController.h"
#import "JBOwnInfoCell.h"
#import "JBOwnNormalCell.h"
#import "NormalCellModel.h"
#import "InfoCellModel.h"
#import "JBOwnGroup.h"
#import "UIButton+WebCache.h"
#import "MBProgressHUD+MJ.h"
#import "SetttingController.h"

@interface JBOwnViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableview;
@property(nonatomic,strong) UIImageView *loginView;
@property(nonatomic,strong) UIButton *loginBtn;
@property(nonatomic,strong) UILabel *noticeLabel;
@property(nonatomic,strong) UILabel *nickname;
@property(nonatomic,assign) BOOL isLogin;
//网络请求返回的字典数据
@property(nonatomic,strong) NSDictionary *dictData;

@property(nonatomic,strong) NSMutableArray *normalArray;

@end

@implementation JBOwnViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
}
//隐藏导航栏
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    //检测沙盒中是够存有账户token
    [self checkLoginStatu];
}

-(void)checkLoginStatu
{
    JBAccount *account=[JBAccountTool account];
    if (account.token==nil) {
        self.isLogin=NO;
        [self addLoginWithNoToken];
    }else{
        self.isLogin=YES;
        [self addLoginWithToken];
    }
}

//有token的界面
-(void)addLoginWithToken
{
    [MBProgressHUD showMessage:@"获取用户信息中..."];
    //发送网络请求，获取用户数据
    JBAccount *account=[JBAccountTool account];
    //使用AFN获取网络数据
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //构造参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"userid"]=account.userid;
    params[@"token"]=account.token;
    //请求url
    NSString *url=@"http://capp.tanlu.cc/v120/user/usercenter";
    //开始请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *msg=responseObject[@"msg"];
        if ([msg isEqualToString:@"操作成功"]) {
            //请求成功
            self.dictData=[NSDictionary dictionary];
            self.dictData=responseObject[@"userinfo"];
            //初始化界面
            [self addUpWithToken];
            [self addGroup];
            //下面的cell界面
            [self addLow];
        }else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号以过期,请重新登录" preferredStyle:UIAlertControllerStyleAlert];
            //创建一个action
            UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
            [JBAccountTool logoutAccount];
            self.isLogin=NO;
            [self addLoginWithNoToken];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
    }];
    [MBProgressHUD hideHUD];
}

//无token的界面
-(void)addLoginWithNoToken
{
    [self addUpNoToken];
    [self addGroup];
    [self addLow];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.noticeLabel.text=@"您还没有登录哟";
}
//添加组
-(void)addGroup
{
    self.normalArray=[NSMutableArray array];
    //分组
    //第一组
    JBOwnGroup *group0=[[JBOwnGroup alloc] init];
    InfoCellModel *info1=[[InfoCellModel alloc] initWithImageName:@"my_11" title:@"我的钱包"];
    InfoCellModel *info2=[[InfoCellModel alloc] initWithImageName:@"my_22" title:@"我的档案"];
    InfoCellModel *info4=[[InfoCellModel alloc] initWithImageName:@"my_44" title:@"我的工资单"];
    group0.items=@[info1,info2,info4];
    
    //第二组
    JBOwnGroup *group1=[[JBOwnGroup alloc] init];
    NSString *verifystatusdesc=@"未认证";
    if (self.isLogin) {
        verifystatusdesc=self.dictData[@"verifystatusdesc"];
    }
    NormalCellModel *one=[[NormalCellModel alloc] initWithImage:@"vertifyInform" titleOne:@"实名认证" titleTwo:verifystatusdesc];
    NormalCellModel *two=[[NormalCellModel alloc] initWithImage:@"评价_4" titleOne:@"收到的评价" titleTwo:nil];
    NormalCellModel *three=[[NormalCellModel alloc] initWithImage:@"myattention" titleOne:@"我的关注" titleTwo:nil];
    NormalCellModel *four=[[NormalCellModel alloc] initWithImage:@"stu_work_ask" titleOne:@"我的咨询" titleTwo:nil];
    NormalCellModel *five=[[NormalCellModel alloc] initWithImage:@"消息" titleOne:@"我的消息" titleTwo:nil];
    group1.items=@[one,two,three,four,five];
    //第三组
    JBOwnGroup *group2=[[JBOwnGroup alloc] init];
    NormalCellModel *six=[[NormalCellModel alloc] initWithImage:@"设置" titleOne:@"设置" titleTwo:nil];
    group2.items=@[six];
    
    //第四组
    JBOwnGroup *group3=[[JBOwnGroup alloc] init];
    if (self.isLogin) {
        
        NormalCellModel *seven=[[NormalCellModel alloc] initWithImage:@"更换" titleOne:@"退出账号" titleTwo:nil];
        group3.items=@[seven];
    }
    [self.normalArray addObject:group0];
    [self.normalArray addObject:group1];
    [self.normalArray addObject:group2];
    if (self.isLogin) {
        [self.normalArray addObject:group3];
    }
}

-(void)addUpWithToken
{
    //上面的登陆界面
    //loginView
    self.loginView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下down"] highlightedImage:[UIImage imageNamed:@"下down"]];
    self.loginView.frame=CGRectMake(0, 0, self.view.bounds.size.width, 150);
    self.loginView.userInteractionEnabled=YES;
    //loginBtn
    self.loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.center=CGPointMake(_loginView.center.x, _loginView.center.y);
    self.loginBtn.bounds=CGRectMake(0, 0, 40,40);
    [self.loginBtn.layer setMasksToBounds:YES];
    [self.loginBtn.layer setCornerRadius:20];
    [self.loginBtn.layer setBorderWidth:1];
    [self.loginBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    //添加点击时间
    [self.loginBtn addTarget:self action:@selector(avatarPage) forControlEvents:UIControlEventTouchUpInside];
    //nickname
    self.nickname=[[UILabel alloc] init];
    self.nickname.center=CGPointMake(_loginView.center.x, _loginView.center.y+40);
    self.nickname.bounds=CGRectMake(0, 0, 200,25);
    self.nickname.textAlignment=NSTextAlignmentCenter;
    self.nickname.textColor=[UIColor whiteColor];
    self.nickname.font=[UIFont systemFontOfSize:15];
    //loginlabel
    self.noticeLabel=[[UILabel alloc] init];
    self.noticeLabel.center=CGPointMake(_loginView.center.x, _loginView.center.y+60);
    self.noticeLabel.bounds=CGRectMake(0, 0, 200,25);
    self.noticeLabel.textAlignment=NSTextAlignmentCenter;
    self.noticeLabel.textColor=[UIColor whiteColor];
    self.noticeLabel.font=[UIFont systemFontOfSize:15];
    //添加到self.view中
    [self.loginView addSubview:self.loginBtn];
    [self.loginView addSubview:self.noticeLabel];
    [self.loginView addSubview:self.nickname];
    [self.view addSubview:self.loginView];
    //设置头像
    if ([self.dictData[@"userico"] isEqualToString:@""]) {
        [self.loginBtn setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
    }else{
        [self.loginBtn sd_setImageWithURL:[NSURL URLWithString:self.dictData[@"userico"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"avatar"]];
    }
    self.nickname.text=self.dictData[@"username"];
    self.noticeLabel.text=self.dictData[@"phone"];
}

-(void)addUpNoToken
{
    //上面的登陆界面
    //loginView
    self.loginView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下down"] highlightedImage:[UIImage imageNamed:@"下down"]];
    self.loginView.frame=CGRectMake(0, 0, self.view.bounds.size.width, 150);
    self.loginView.userInteractionEnabled=YES;
    //loginBtn
    self.loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.center=CGPointMake(_loginView.center.x, _loginView.center.y);
    self.loginBtn.bounds=CGRectMake(0, 0, 80,25);
    self.loginBtn.backgroundColor=[UIColor clearColor];
    [self.loginBtn.layer setMasksToBounds:YES];
    [self.loginBtn.layer setCornerRadius:10];
    [self.loginBtn.layer setBorderWidth:1];
    [self.loginBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    //添加点击时间
    [self.loginBtn addTarget:self action:@selector(loginPage) forControlEvents:UIControlEventTouchUpInside];
    //loginlabel
    self.noticeLabel=[[UILabel alloc] init];
    self.noticeLabel.center=CGPointMake(_loginView.center.x, _loginView.center.y+40);
    self.noticeLabel.bounds=CGRectMake(0, 0, 200,25);
    self.noticeLabel.textAlignment=NSTextAlignmentCenter;
    self.noticeLabel.textColor=[UIColor whiteColor];
    self.noticeLabel.font=[UIFont systemFontOfSize:15];
    //添加到self.view中
    [self.loginView addSubview:self.loginBtn];
    [self.loginView addSubview:self.noticeLabel];
    [self.view addSubview:self.loginView];
}

-(void)addLow
{
    //下面的cell界面
    CGFloat x=0;
    CGFloat y=150;
    CGFloat w=self.view.bounds.size.width;
    CGFloat h=self.view.bounds.size.height-150-49;
    UITableView *tableview=[[UITableView alloc] initWithFrame:CGRectMake(x, y, w, h) style:UITableViewStyleGrouped];
    tableview.delegate=self;
    tableview.dataSource=self;
    self.tableview=tableview;
    [self.view addSubview:tableview];
}

-(void)loginPage
{
    LoginController *vc=[[LoginController alloc] init];
    vc.hidesBottomBarWhenPushed=YES;
    vc.title=@"登录";
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)avatarPage
{
    
}

//调整状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
//实现tableview的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //每组有多少行
    if (section==0) {
        return 1;
    }
    JBOwnGroup *temp=self.normalArray[section];
    return temp.items.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.normalArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        JBOwnInfoCell *cell=[JBOwnInfoCell initWithTableView:tableView];
        //取出模型
        JBOwnGroup *group=self.normalArray[0];
        cell.dataArray=group.items;
        return cell;
    }else{
        JBOwnNormalCell *cell=[JBOwnNormalCell initWithTableView:tableView];
        //取出模型
        JBOwnGroup *group=self.normalArray[indexPath.section];
        NormalCellModel *data=group.items[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:data.imageName];
        cell.textLabel.text=data.titleOne;
        cell.detailTextLabel.text=data.titleTwo;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.1;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 70;
    }
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==3) {
        //注销
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要退出登录吗？" preferredStyle:UIAlertControllerStyleAlert];
        //创建一个action
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.tableview reloadData];
        }];
        UIAlertAction *confirm=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [JBAccountTool logoutAccount];
            [self viewWillAppear:YES];
        }];
        [alert addAction:cancel];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }else if (indexPath.section==2){
        //设置
        SetttingController *vc=[[SetttingController alloc] initWithStyle:UITableViewStyleGrouped];
        vc.hidesBottomBarWhenPushed=YES;
        self.navigationController.navigationBarHidden=NO;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section==1){
        
    }
}


@end
