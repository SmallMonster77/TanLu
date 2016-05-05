//
//  Cell7.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JBJobDetailModel;

@interface Cell7 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *details;
@property (weak, nonatomic) IBOutlet UILabel *fan;
@property (weak, nonatomic) IBOutlet UILabel *zhu;
@property (weak, nonatomic) IBOutlet UILabel *dixin;
@property (weak, nonatomic) IBOutlet UILabel *ticheng;
@property (weak, nonatomic) IBOutlet UILabel *peixun;
@property (weak, nonatomic) IBOutlet UILabel *qita;
@property(nonatomic,strong) JBJobDetailModel *model;

@end
