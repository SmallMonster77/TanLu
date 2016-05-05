//
//  Cell2.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JBJobDetailModel;
@interface Cell2 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *workdate;
@property (weak, nonatomic) IBOutlet UILabel *worktime;
@property (weak, nonatomic) IBOutlet UILabel *wordcondition;
@property(nonatomic,strong) JBJobDetailModel *model;
@end
