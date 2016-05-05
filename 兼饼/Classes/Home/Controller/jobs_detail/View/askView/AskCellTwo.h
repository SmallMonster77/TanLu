//
//  AskCellTwo.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/21.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JBConsultationsModel;

@interface AskCellTwo : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *contact;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *btnset;

@property(nonatomic,strong) JBConsultationsModel *model;

@end
