//
//  JBCorpinfoModel.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/17.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBCorpinfoModel : NSObject

//公司名称
@property(nonatomic,copy) NSString *corpname;
//是否有关注
@property(nonatomic,assign) BOOL hasattention;
//公司评分
@property(nonatomic,copy) NSString *corpstarlevel;
//公司发布的工作
@property(nonatomic,assign) int corpjobnum;
@end
