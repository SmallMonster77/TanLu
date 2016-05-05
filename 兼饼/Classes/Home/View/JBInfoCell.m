//
//  JBInfoCell.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/15.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBInfoCell.h"
#import "UIImageView+WebCache.h"
#include "JBInfoModel.h"

@interface JBInfoCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *workdate;
@property (weak, nonatomic) IBOutlet UILabel *viewAndDistance;
@property (weak, nonatomic) IBOutlet UILabel *settlecircle;
@property (weak, nonatomic) IBOutlet UILabel *settletype;
@property (weak, nonatomic) IBOutlet UILabel *salary;


@end

@implementation JBInfoCell

-(void)setData:(JBInfoModel *)data
{
    _data=data;
    //图片
    [self.icon sd_setImageWithURL:[NSURL URLWithString:data.icon]];
    //标题
    self.title.text=data.title;
    //浏览量和距离
    self.viewAndDistance.text=[NSString stringWithFormat:@"%@人浏览/%@",data.pageview,data.distance];
    //工资
    self.salary.text=[NSString stringWithFormat:@"%@",data.salary];
    //结算方式
    self.settletype.text=data.settletype;
    //结算范围
    self.settlecircle.text=data.settlecircle;
    //工作时间
    NSString *begindate=[data.begindate substringToIndex:data.begindate.length-3];
    NSString *enddate=[data.enddate substringToIndex:data.enddate.length-3];
    NSDate *dateOne=[NSDate dateWithTimeIntervalSince1970:[begindate doubleValue]];
    NSDate *dateTwo=[NSDate dateWithTimeIntervalSince1970:[enddate doubleValue]];
    //将date转换成字符串
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM.dd"];
    begindate=[formatter stringFromDate:dateOne];
    enddate=[formatter stringFromDate:dateTwo];
    self.workdate.text=[NSString stringWithFormat:@"工作日期%@-%@",begindate,enddate];
    //添加标签
    NSArray *labelArray=data.labels;
    CGFloat width=[UIScreen mainScreen].bounds.size.width-24;
    int j=0;
    for (int i=(int)labelArray.count-1; i>=0;i--) {
        if (![labelArray[i] isEqualToString:@""]) {
            UILabel *label=[[UILabel alloc] init];
            label.frame=CGRectMake(width-j*20, 26, 18, 18);
                label.layer.borderColor=HWRandomColor.CGColor;
                label.layer.borderWidth=1;
                label.layer.cornerRadius=9;
                label.text=labelArray[i];
                label.textAlignment=NSTextAlignmentCenter;
                label.textColor=HWRandomColor;
                label.font=[UIFont systemFontOfSize:10];
                [self.contentView addSubview:label];
            j++;
        }
    }
}


@end
