//
//  NormalCellModel.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/11.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "NormalCellModel.h"

@implementation NormalCellModel

-(NormalCellModel *)initWithImage:(NSString *)imageName titleOne:(NSString *)titileOne titleTwo:(NSString *)titleTwo
{
    NormalCellModel *model=[[NormalCellModel alloc] init];
    model.imageName=imageName;
    model.titleOne=titileOne;
    model.titleTwo=titleTwo;
    return model;
}


@end
