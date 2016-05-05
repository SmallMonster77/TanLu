//
//  JBAccountTool.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/22.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBAccount.h"

@interface JBAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(JBAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (JBAccount *)account;
//注销登录，删掉账户
+(void)logoutAccount;

@end
