//
//  JBAccount.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/22.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBAccount : NSObject<NSCoding>

@property(nonatomic,copy) NSString *sex;
@property(nonatomic,copy) NSString *phone;
@property(nonatomic,copy) NSString *username;
@property(nonatomic,copy) NSString *token;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *userid;


@end
