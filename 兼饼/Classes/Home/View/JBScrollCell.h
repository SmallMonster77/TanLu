//
//  JBScrollCell.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/10.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JBScrollCell;
//代理
@protocol JBScrollCellDelegate <NSObject>

@optional
-(void)pageJump:(JBScrollCell *)cell pageUrl:(NSString *)pageUrl;

@end



@interface JBScrollCell : UITableViewCell

//scrollModel的数据数组
@property(nonatomic,strong) NSArray *dataArray;
//代理
@property(nonatomic,weak) id<JBScrollCellDelegate> delegate;



-(void) start;
//类初始化方法
+(instancetype)initWithTableView:(UITableView *)tableview;
@end
