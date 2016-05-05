//
//  AskCellOne.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/21.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "AskCellOne.h"
#import "JBConsultationsModel.h"
#import "UIImageView+WebCache.h"

@implementation AskCellOne

-(void)setModel:(JBConsultationsModel *)model
{
    _model=model;
    //设置btn的圆角样式
    self.btnSet.layer.cornerRadius=6;
    self.btnSet.layer.borderWidth=1;
    self.btnSet.layer.borderColor=HWColor(0.95*255, 0.66*255, 0.21*255).CGColor;
    self.btnSet.textColor=HWColor(0.95*255, 0.66*255, 0.21*255);
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.qicon] placeholderImage:[UIImage imageNamed:@"avatar"]];
    self.imgView.layer.cornerRadius=20;
    self.imgView.layer.masksToBounds=YES;
    self.nickname.text=model.qphone;
    self.time.text=model.qtime;
    self.content.text=model.qcontent;
}

- (void)awakeFromNib {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}



@end
