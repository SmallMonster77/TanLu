//
//  AskCellTwo.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/21.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "AskCellTwo.h"
#import "UIImageView+WebCache.h"
#import "JBConsultationsModel.h"

@implementation AskCellTwo

-(void)setModel:(JBConsultationsModel *)model
{
    _model=model;
    //设置btn的圆角样式
    self.btnset.layer.cornerRadius=6;
    self.btnset.layer.borderWidth=1;
    self.btnset.layer.borderColor=HWColor(0.32*255, 0.74*255, 0.54*255).CGColor;
    self.btnset.textColor=HWColor(0.32*255, 0.74*255, 0.54*255);
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.aicon] placeholderImage:[UIImage imageNamed:@"avatar"]];
    self.imgView.layer.cornerRadius=20;
    self.imgView.layer.masksToBounds=YES;
    self.contact.text=model.aname;
    self.time.text=model.atime;
    self.content.text=model.acontent;
}

- (void)awakeFromNib {
    // Initialization code
}


@end
