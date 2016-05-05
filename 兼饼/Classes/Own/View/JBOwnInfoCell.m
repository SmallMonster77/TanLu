//
//  JBOwnInfoCell.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/11.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBOwnInfoCell.h"
#import "JBOwnInfoButton.h"
#import "InfoCellModel.h"


@interface JBOwnInfoCell()
@property(nonatomic,strong) NSMutableArray *btnArray;

@end

@implementation JBOwnInfoCell

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray=dataArray;
}

-(NSMutableArray *)btnArray
{
    [self dataArray];
    if (_btnArray==nil) {
        _btnArray=[NSMutableArray array];
        for (int i=0; i<3; i++) {
            //取出模型
            InfoCellModel *data=_dataArray[i];
            JBOwnInfoButton *btn=[[JBOwnInfoButton alloc] initWithImage:data.imageName name:data.title];
            [_btnArray addObject:btn];
        }
    }
    return _btnArray;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat currentWidth=[UIScreen mainScreen].bounds.size.width/3;
    //获取上下文
    CGContextRef ctf=UIGraphicsGetCurrentContext();
    //设置拼接路径
    UIBezierPath *path=[UIBezierPath bezierPath];
    for (int i=0; i<2; i++) {
        [path moveToPoint:CGPointMake((i+1)*currentWidth, 20)];
        [path addLineToPoint:CGPointMake((i+1)*currentWidth, 50)];
        CGContextAddPath(ctf, path.CGPath);
        CGContextSetLineWidth(ctf, 1);
        [HWColor(0.89*255, 0.89*255, 0.90*255) setStroke];
        CGContextStrokePath(ctf);
    }
    CGFloat infoWidth=[UIScreen mainScreen].bounds.size.width/3;
    for (int i=0; i<3; i++) {
        JBOwnInfoButton *btn=self.btnArray[i];
        btn.frame=CGRectMake(i*infoWidth, 0, infoWidth, 70);
        [self.contentView addSubview:btn];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)initWithTableView:(UITableView *)tableview
{
    JBOwnInfoCell *cell=[tableview dequeueReusableCellWithIdentifier:@"infocell"];
    if (cell==nil) {
        cell=[[JBOwnInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infocell"];
    }
    return cell;
}

@end
