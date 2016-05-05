//
//  Cell2.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell2.h"
#import "JBJobDetailModel.h"
@implementation Cell2

-(void)setModel:(JBJobDetailModel *)model
{
    _model=model;
    //工作日期
    self.workdate.text=[NSString stringWithFormat:@"工作日期:%@ - %@",[model.workdays firstObject],[model.workdays lastObject]];
    //工作时间
    self.worktime.text=[NSString stringWithFormat:@"工作时间:%@ - %@",model.starttime,model.endtime];
    //招聘要求
    self.wordcondition.text=[NSString stringWithFormat:@"工作要求:%@",model.condition];
    
}

@end
