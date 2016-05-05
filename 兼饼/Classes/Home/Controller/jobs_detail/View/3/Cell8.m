//
//  Cell8.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell8.h"
#import "JBJobDetailModel.h"

@implementation Cell8

-(void)setModel:(JBJobDetailModel *)model
{
    _model=model;
}

//画下面的标签
-(void)drawRect:(CGRect)rect
{
    NSArray *tags=self.model.tags;
    CGFloat x=18;
    for (int i=0; i<tags.count; i++) {
        UILabel *label=[[UILabel alloc] init];
        label.text=tags[i];
        label.textColor=HWColor(0.95*255, 0.66*255, 0.21*255);
        label.font=[UIFont systemFontOfSize:12];
        CGSize labelsize=[tags[i] sizeWithAttributes:@{
                                                       NSFontAttributeName:[UIFont systemFontOfSize:12]
                                                       }];
        
        label.layer.borderColor=HWColor(0.95*255, 0.66*255, 0.21*255).CGColor;
        label.layer.borderWidth=1;
        label.textAlignment=NSTextAlignmentCenter;
        label.frame=CGRectMake(x, 10, labelsize.width+10, labelsize.height+5);
        x=x+labelsize.width+15;
        [self.contentView addSubview:label];
    }
}

-(void)awakeFromNib
{
    //取消选中的状态
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

@end
