//
//  Cell9.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "Cell9.h"

@implementation Cell9


- (void)awakeFromNib {
    self.attention.layer.cornerRadius=10;
    self.attention.layer.borderColor=HWColor(0.32*255, 0.74*255, 0.54*255).CGColor;
    self.attention.layer.borderWidth=1;
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

-(IBAction)attensioncorp
{
    NSLog(@"关注");
}

@end
