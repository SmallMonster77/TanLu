//
//  Cell1.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell1.h"
#import "JBJobDetailModel.h"
#import "UIImageView+WebCache.h"

@implementation Cell1

-(void)setModel:(JBJobDetailModel *)model
{
    _model=model;
    //标题
    self.title.text=model.title;
    //图片
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    //工资
    self.salary.text=[NSString stringWithFormat:@"%d%@",(int)model.salary,model.settletype];
    //签约人数/总人数
    self.member.text=[NSString stringWithFormat:@"已签约%d人/招聘%d人",model.confirmcount,model.needcount];
    //地区
    self.type.text=model.area;
}

@end
