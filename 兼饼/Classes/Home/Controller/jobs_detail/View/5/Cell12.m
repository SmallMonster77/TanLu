//
//  Cell12.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell12.h"

@implementation Cell12

-(void)setData:(NSArray *)data
{
    _data=data;
}

- (void)awakeFromNib {
    self.lookAsk.layer.cornerRadius=10;
    self.lookAsk.layer.borderColor=HWColor(0.32*255, 0.74*255, 0.54*255).CGColor;
    self.lookAsk.layer.borderWidth=1;
    
    self.toAsk.layer.cornerRadius=10;
    self.toAsk.layer.borderColor=HWColor(0.32*255, 0.74*255, 0.54*255).CGColor;
    self.toAsk.layer.borderWidth=1;
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}


-(IBAction)askDetail{
    if ([self.delegate respondsToSelector:@selector(didClicked:)]) {
        [self.delegate didClicked:self.data];
    }
}

@end
