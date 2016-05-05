//
//  JBOwnNormalCell.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/11.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBOwnNormalCell.h"

@implementation JBOwnNormalCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font=[UIFont systemFontOfSize:13];
        self.detailTextLabel.font=[UIFont systemFontOfSize:13];
    }
    return self;
}

+(instancetype)initWithTableView:(UITableView *)tableview
{
    JBOwnNormalCell *cell=[tableview dequeueReusableCellWithIdentifier:@"normalcell"];
    if (cell==nil) {
        cell=[[JBOwnNormalCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"normalcell"];
    }
    return cell;
}

@end
