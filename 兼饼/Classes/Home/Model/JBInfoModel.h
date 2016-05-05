//
//  JBInfoModel.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/10.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBInfoModel : NSObject

@property(nonatomic,copy) NSString *ID;

@property(nonatomic,copy) NSString *icon;

@property(nonatomic,strong) NSArray *labels;

@property(nonatomic,strong) NSArray *titlelabels;

@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *pageview;

@property(nonatomic,copy) NSString *distance;

@property(nonatomic,copy) NSString *jobtype;

@property(nonatomic,copy) NSString *settletype;

@property(nonatomic,copy) NSString *settlecircle;

@property(nonatomic,strong) NSNumber *salary;

@property(nonatomic,strong) NSString *begindate;

@property(nonatomic,strong) NSString *enddate;

@end
