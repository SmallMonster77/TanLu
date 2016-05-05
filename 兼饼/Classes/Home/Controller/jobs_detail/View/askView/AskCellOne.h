//
//  AskCellOne.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/21.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JBConsultationsModel;
@interface AskCellOne : UITableViewCell

@property(nonatomic,strong) JBConsultationsModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *btnSet;



@end
