//
//  askDetailController.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/21.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "askDetailController.h"
#import "JBConsultationsModel.h"
#import "AskCellOne.h"
#import "AskCellTwo.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface askDetailController ()

@end

@implementation askDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"AskCellOne" bundle:nil] forCellReuseIdentifier:@"askOne"];
    [self.tableView registerNib:[UINib nibWithNibName:@"AskCellTwo" bundle:nil] forCellReuseIdentifier:@"askTwo"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //取出模型
    JBConsultationsModel *model=self.data[section];
    if (model.aicon==nil) {
        return 1;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        AskCellOne *cell=[tableView dequeueReusableCellWithIdentifier:@"askOne"];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"AskCellOne" owner:nil options:nil]lastObject];
        }
        cell.model=self.data[indexPath.section];
        return cell;
    }else{
        AskCellTwo *cell=[tableView dequeueReusableCellWithIdentifier:@"askTwo"];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"AskCellTwo" owner:nil options:nil]lastObject];
        }
        cell.model=self.data[indexPath.section];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return [tableView fd_heightForCellWithIdentifier:@"askOne" cacheByIndexPath:indexPath configuration:^(AskCellOne *cell) {
            cell.model=self.data[indexPath.row];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"askTwo" cacheByIndexPath:indexPath configuration:^(AskCellTwo *cell) {
            cell.model=self.data[indexPath.row];
        }];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

@end
