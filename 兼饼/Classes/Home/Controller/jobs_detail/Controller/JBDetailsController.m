//
//  JBDetailsController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/17.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBDetailsController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "JBJobDetailModel.h"
#import "JBCorpinfoModel.h"
#import "JBConsultationsModel.h"
#import "Cell1.h"
#import "Cell2.h"
#import "Cell3.h"
#import "Cell4.h"
#import "Cell5.h"
#import "Cell6.h"
#import "Cell7.h"
#import "Cell8.h"
#import "Cell9.h"
#import "Cell10.h"
#import "Cell11.h"
#import "Cell12.h"
#import "askDetailController.h"


@interface JBDetailsController ()<UITableViewDataSource,UITableViewDelegate,JBConsultationsDelegate>

//公司名数据
@property(nonatomic,strong) JBCorpinfoModel *corpDate;
//详细内容数据
@property(nonatomic,strong) JBJobDetailModel *detailDate;
//咨询内容
@property(nonatomic,strong) NSMutableArray *askDate;

@property(nonatomic,strong) UITableView *tableview;

@end

@implementation JBDetailsController


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置回退按钮
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"upBack" highImage:@"upBack"];
    self.view.backgroundColor=[UIColor whiteColor];
    //开始网络请求
    [self getStartWithUser_ID:nil token:nil jobid:self.job_id];
    //添加tableview
    [self addTableview];
    //添加底部按钮
    [self addBottomBtn];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//开始网络请求
-(void)getStartWithUser_ID:(NSString *)user_id token:(NSString *)token jobid:(NSString *)jobid
{
    self.askDate=[NSMutableArray array];
    //使用AFN获取网络数据
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //构造参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"v"]=@"1";
    params[@"userid"]=user_id;
    params[@"token"]=token;
    params[@"data"]=[NSString stringWithFormat:@"{\"jobid\" : %@}",jobid];
    
    //请求url
    NSString *url=@"http://capp.tanlu.cc/v120/job/detail";
    //开始请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        //字典转模型
        NSDictionary *dataOne=responseObject[@"corpinfo"];
        NSDictionary *dataTwo=responseObject[@"jobdetail"];
        NSArray *dataThree=responseObject[@"consultations"];
        //公司信息
        self.corpDate=[JBCorpinfoModel objectWithKeyValues:dataOne];
        //职位详情
        self.detailDate=[JBJobDetailModel objectWithKeyValues:dataTwo];
        //对咨询数据进行解析
        for (NSDictionary *dict in dataThree) {
            JBConsultationsModel *model=[JBConsultationsModel objectWithKeyValues:dict];
            [self.askDate addObject:model];
        }
        [self.tableview reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
    }];

}

//添加tableview
-(void)addTableview
{
    UITableView *tablaview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-44) style:UITableViewStyleGrouped];
    tablaview.showsVerticalScrollIndicator=NO;
    [self.view addSubview:tablaview];
    //设置tableview的代理和数据源
    tablaview.delegate=self;
    tablaview.dataSource=self;
    [tablaview registerNib:[UINib nibWithNibName:@"Cell6" bundle:nil] forCellReuseIdentifier:@"cell6"];
    [tablaview registerNib:[UINib nibWithNibName:@"Cell7" bundle:nil] forCellReuseIdentifier:@"cell7"];
    self.tableview=tablaview;

}

//添加底部按钮
-(void)addBottomBtn
{
    UIButton *btnOne=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnTwo=[UIButton buttonWithType:UIButtonTypeCustom];
    //设置颜色
    btnOne.backgroundColor=HWColor(0.95*255, 0.66*255, 0.21*255);
    btnTwo.backgroundColor=HWColor(0.32*255, 0.74*255, 0.54*255);
    //设置frame
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height-44;
    btnOne.frame=CGRectMake(0, height, width*0.25, 44);
    btnTwo.frame=CGRectMake(width*0.25, height, width*0.75, 44);
    [btnOne setTitle:@"关注" forState:UIControlStateNormal];
    [btnTwo setTitle:@"报名详情" forState:UIControlStateNormal];
    [self.view addSubview:btnOne];
    [self.view addSubview:btnTwo];
}

//实现tableview的代理和数据源方法

//有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
//每组返回多少行cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else if (section==1){
        return 2;
    }else if (section==2){
        return 4;
    }else if (section==3){
        return 2;
    }else{
        return 2;
    }
}
//每个cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            Cell1 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell1" owner:nil options:nil] lastObject];
            }
            cell.model=self.detailDate;
            return cell;
        }else{
            Cell2 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell2"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell2" owner:nil options:nil] lastObject];
            }
            cell.model=self.detailDate;
            return cell;
        }
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            Cell3 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell3"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell3" owner:nil options:nil] lastObject];
            }
            return cell;
        }else{
            Cell4 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell4"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell4" owner:nil options:nil] lastObject];
            }
            cell.model=self.detailDate;
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            Cell5 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell5"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell5" owner:nil options:nil] lastObject];
            }
            return cell;
        }else if (indexPath.row==1){
            Cell6 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell6"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell6" owner:nil options:nil] lastObject];
            }
            cell.model=self.detailDate;
            return cell;
        }else if (indexPath.row==2){
            Cell7 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell7"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell7" owner:nil options:nil] lastObject];
            }
            cell.model=self.detailDate;
            return cell;
        }else{
            Cell8 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell8"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell8" owner:nil options:nil] lastObject];
            }
            cell.model=self.detailDate;
            return cell;
        }
    }else if (indexPath.section==3){
        if (indexPath.row==0) {
            Cell9 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell9"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell9" owner:nil options:nil] lastObject];
            }
            return cell;
        }else{
            Cell10 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell10"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell10" owner:nil options:nil] lastObject];
            }
            cell.model=self.corpDate;
            
            return cell;
        }
    }else{
        if (indexPath.row==0) {
            Cell11 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell11"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell11" owner:nil options:nil] lastObject];
            }
            return cell;
        }else{
            Cell12 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell12"];
            if (cell==nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:@"Cell12" owner:nil options:nil] lastObject];
            }
            cell.data=self.askDate;
            cell.delegate=self;
            return cell;
        }
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 67;
        }else{
            return 102;
        }
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            return 40;
        }else{
            return 80;
        }
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            return 44;
        }else if (indexPath.row==1){
            return [tableView fd_heightForCellWithIdentifier:@"cell6" cacheByIndexPath:indexPath configuration:^(Cell6 *cell) {
                cell.model=self.detailDate;
            }];
        }else if (indexPath.row==2){
            return [tableView fd_heightForCellWithIdentifier:@"cell7" cacheByIndexPath:indexPath configuration:^(Cell7 *cell) {
                cell.model=self.detailDate;
            }];
        }else{
            return 36;
        }
    }else if (indexPath.section==3){
        if (indexPath.row==0) {
            return 44;
        }else{
            return 117;
        }
    }else{
        if (indexPath.row==0) {
            return 44;
        }else{
            return 44;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
//ask的代理方法
-(void)didClicked:(NSArray *)dataArray
{
    askDetailController *vc=[[askDetailController alloc] initWithStyle:UITableViewStyleGrouped];
    vc.data=dataArray;
    vc.title=@"咨询";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
