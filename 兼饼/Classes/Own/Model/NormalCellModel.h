//
//  NormalCellModel.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/11.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JBSettingItemOperation)();

@interface NormalCellModel : NSObject

@property(nonatomic,copy) NSString *imageName;
@property(nonatomic,copy) NSString *titleOne;
@property(nonatomic,copy) NSString *titleTwo;
@property(nonatomic,assign) Class destVc;
@property(nonatomic,copy) JBSettingItemOperation operation;

-(NormalCellModel *)initWithImage:(NSString *)imageName titleOne:(NSString *)titileOne titleTwo:(NSString *)titleTwo;

@end
