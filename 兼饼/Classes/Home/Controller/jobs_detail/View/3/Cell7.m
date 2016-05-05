//
//  Cell7.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell7.h"
#import "JBJobDetailModel.h"

@implementation Cell7

-(void)setModel:(JBJobDetailModel *)model
{
    _model=model;
    //面试详情
    self.details.text=model.interview;
    //是否管饭
    self.fan.text=model.eatinfo;
    //是否关注
    self.zhu.text=model.hostelinfo;
    //底薪任务
    self.dixin.text=model.taskinfo;
    //提成
    self.ticheng.text=model.resulthope;
    //培训详情
    self.peixun.text=model.train;
    //其他事项
    self.qita.text=model.otherrequire;
}

@end
