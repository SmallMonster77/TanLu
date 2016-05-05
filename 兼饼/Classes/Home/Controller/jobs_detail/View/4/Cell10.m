//
//  Cell10.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell10.h"

@implementation Cell10

-(void)setModel:(JBCorpinfoModel *)model
{
    _model=model;
    //公司名称
    self.corpname.text=model.corpname;
    //公司提供的职位
    self.zhaopin.text=[NSString stringWithFormat:@"正在招聘:%d个职位",model.corpjobnum];
}

-(void)awakeFromNib
{
    self.entercorp.layer.cornerRadius=10;
    self.entercorp.layer.borderColor=HWColor(0.32*255, 0.74*255, 0.54*255).CGColor;
    self.entercorp.layer.borderWidth=1;
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}
//画星级评分
-(void)drawRect:(CGRect)rect
{
    int level=[self.model.corpstarlevel intValue];
    int i=0;
    for (i=0; i<level; i++) {
        //画星级评分
        UIImageView *imgview=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
        imgview.frame=CGRectMake(19+i*15, 33, 14, 13);
        [self.contentView addSubview:imgview];
    }
    UILabel *starLabel=[[UILabel alloc] init];
    starLabel.text=self.model.corpstarlevel;
    starLabel.font=[UIFont systemFontOfSize:14];
    starLabel.textColor=HWColor(0.95*255, 0.66*255, 0.21*255);
    starLabel.frame=CGRectMake(22+i*15, 33, 25, 13);
    [self.contentView addSubview:starLabel];
}


@end
