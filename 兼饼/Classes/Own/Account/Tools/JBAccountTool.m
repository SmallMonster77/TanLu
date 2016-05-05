//
//  JBAccountTool.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/22.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

// 账号的存储路径
#define JBAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

#import "JBAccountTool.h"
#import "MBProgressHUD+MJ.h"

@implementation JBAccountTool

//保存账户
+(void)saveAccount:(JBAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:JBAccountPath];
    
}

//返回账户
+(JBAccount *)account
{
    // 加载模型
    JBAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:JBAccountPath];
    return account;
}
//销毁账户
+(void)logoutAccount
{
    NSFileManager *fileManeger=[NSFileManager defaultManager];
    if ([fileManeger isDeletableFileAtPath:JBAccountPath]) {
        [fileManeger removeItemAtPath:JBAccountPath error:nil];
        [MBProgressHUD showSuccess:@"注销成功"];
    }
    
}

@end
