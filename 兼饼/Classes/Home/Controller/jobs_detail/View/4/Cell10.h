//
//  Cell10.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/18.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBCorpinfoModel.h"

@interface Cell10 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *corpname;

@property (weak, nonatomic) IBOutlet UILabel *zhaopin;
@property (weak, nonatomic) IBOutlet UIButton *entercorp;

@property(nonatomic,strong) JBCorpinfoModel *model;

@end
