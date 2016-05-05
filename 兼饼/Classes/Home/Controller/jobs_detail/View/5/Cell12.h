//
//  Cell12.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JBConsultationsModel;
//代理
@protocol JBConsultationsDelegate <NSObject>
@optional
-(void)didClicked:(NSArray *)dataArray;

@end



@interface Cell12 : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *lookAsk;
@property (weak, nonatomic) IBOutlet UIButton *toAsk;
//代理
@property(nonatomic,weak) id<JBConsultationsDelegate> delegate;
@property(nonatomic,strong) NSArray *data;
@end
