//
//  JBListCell.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/10.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBListCell.h"
#import "JBListButton.h"
#import "JBListModel.h"

@interface JBListCell()

@property(nonatomic,strong) NSMutableArray *btnArray;

@end

@implementation JBListCell

-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray=dataArray;
    for (int i=0; i<self.dataArray.count; i++) {
        //取出模型
        JBListModel *data=self.dataArray[i];
        JBListButton *btn=[[JBListButton alloc] initWithImage:data.icon name:data.name];
        btn.tag=i;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArray addObject:btn];
    }
    CGFloat listWith=[UIScreen mainScreen].bounds.size.width/4;
    for (int i=0; i<self.dataArray.count; i++) {
        JBListButton *btn=self.btnArray[i];
        btn.frame=CGRectMake(i*listWith, 0, listWith, 80);
        [self.contentView addSubview:btn];
    }
}

-(void)btnClicked:(UIButton *)btn
{
    JBListModel *data=self.dataArray[btn.tag];
    if ([_delegate respondsToSelector:@selector(btnJump:withUrl:)]) {
        [_delegate btnJump:self withUrl:data.url];
    }
}


-(NSMutableArray *)btnArray
{
    if (_btnArray==nil) {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
}



//取消选择的效果
-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    // Configure the view for the selected state
}

+(instancetype)initWithTableView:(UITableView *)tableview
{
    JBListCell *cell=[tableview dequeueReusableCellWithIdentifier:@"List_Cell"];
    if (cell==nil) {
        cell=[[JBListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"List_Cell"];
    }
    return cell;
}

@end
