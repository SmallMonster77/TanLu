//
//  InfoCellModel.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/13.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "InfoCellModel.h"

@implementation InfoCellModel

-(InfoCellModel *)initWithImageName:(NSString *)imageName title:(NSString *)title
{
    InfoCellModel *info=[[InfoCellModel alloc] init];
    info.imageName=imageName;
    info.title=title;
    return info;
}


@end
