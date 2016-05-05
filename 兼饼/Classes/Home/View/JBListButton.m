//
//  JBListButton.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/10.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBListButton.h"
#import "UIButton+WebCache.h"

@implementation JBListButton


-(JBListButton *)initWithImage:(NSString *)image name:(NSString *)name
{
    JBListButton *btn=[[JBListButton alloc] init];
    [btn sd_setImageWithURL:[NSURL URLWithString:image] forState:UIControlStateNormal];
   // [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:name forState:UIControlStateNormal];
    btn.titleLabel.textAlignment=NSTextAlignmentCenter;
    btn.titleLabel.font=[UIFont systemFontOfSize:13];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return btn;
}

//重写方法，设置title和image的位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
//    CGFloat titleX=contentRect.size.width*0.4;
//    CGFloat titleY=contentRect.size.height*0.2;
//    CGFloat titleW=contentRect.size.width*0.6;
//    CGFloat titleH=contentRect.size.height*0.6;
    return CGRectMake(0, 50, contentRect.size.width, 20);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
//    CGFloat titleX=contentRect.size.width*0.4;
//    CGFloat titleY=contentRect.size.height*0.7;
//    CGFloat titleW=contentRect.size.width*0.6;
//    CGFloat titleH=contentRect.size.height*0.3;
    return CGRectMake(contentRect.size.width*0.26, 10, 40, 40);
}

@end
