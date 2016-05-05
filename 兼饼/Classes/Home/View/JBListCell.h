//
//  JBListCell.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/10.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JBListCell;
@protocol JBListCellDelegate<NSObject>

@optional
-(void)btnJump:(JBListCell *)btnCell withUrl:(NSString *)url;

@end

@interface JBListCell : UITableViewCell

//数据数组
@property(nonatomic,strong) NSArray *dataArray;
@property(nonatomic,weak) id<JBListCellDelegate> delegate;

+(instancetype)initWithTableView:(UITableView *)tableview;

@end
