//
//  Cell4.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell4.h"
#import "JBJobDetailModel.h"

@implementation Cell4

-(void)setModel:(JBJobDetailModel *)model
{
    _model=model;
    //地址
    self.address.text=model.address;
    //距离
    self.distance.text=@"1000km";
}

@end
