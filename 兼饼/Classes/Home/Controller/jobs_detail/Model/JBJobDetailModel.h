//
//  JBJobDetailModel.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/17.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBJobDetailModel : NSObject

//经纬度
@property(nonatomic,assign) double la;
@property(nonatomic,assign) double lo;
//结束时间
@property(nonatomic,copy) NSString *endtime;
//招聘状态
@property(nonatomic,copy) NSString *statustext;
//公司下拥有的工作
@property(nonatomic,assign) int belowjobtype;
//标题
@property(nonatomic,copy) NSString *title;
//工作类型
@property(nonatomic,copy) NSString *jobtype;
//area
@property(nonatomic,copy) NSString *area;
//需要的数量
@property(nonatomic,assign) int needcount;
//结算方式
@property(nonatomic,copy) NSString *settlecircle;
//是否有训练
@property(nonatomic,copy) NSString *train;
//工资
@property(nonatomic,assign) double salary;
//工作hope
@property(nonatomic,copy) NSString *resulthope;
//确认的数量
@property(nonatomic,assign) int confirmcount;
//district
@property(nonatomic,copy) NSString *district;
//tags
@property(nonatomic,strong) NSArray *tags;
//icon
@property(nonatomic,copy) NSString *icon;
//开始时间
@property(nonatomic,copy) NSString *starttime;
//mergeworkdays
@property(nonatomic,strong) NSArray *mergeworkdays;
//招聘要求
@property(nonatomic,copy) NSString *condition;
//其他要求
@property(nonatomic,copy) NSString *otherrequire;
@property(nonatomic,copy) NSString *hostelinfo;
@property(nonatomic,copy) NSString *corpname;
@property(nonatomic,strong) NSArray *workdays;
@property(nonatomic,copy) NSString *gathertime;
@property(nonatomic,copy) NSString *interview;
@property(nonatomic,copy) NSString *address;
@property(nonatomic,copy) NSString *settletype;
@property(nonatomic,copy) NSString *eatinfo;
@property(nonatomic,copy) NSString *require;
@property(nonatomic,copy) NSString *gatherplace;
@property(nonatomic,copy) NSString *taskinfo;

@end