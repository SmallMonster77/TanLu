//
//  JBAccount.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/22.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBAccount.h"

@implementation JBAccount

/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.sex forKey:@"sex"];
    [encoder encodeObject:self.phone forKey:@"phone"];
    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.token forKey:@"token"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.img forKey:@"img"];
    [encoder encodeObject:self.userid forKey:@"userid"];
    
}

/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.sex = [decoder decodeObjectForKey:@"sex"];
        self.phone = [decoder decodeObjectForKey:@"phone"];
        self.username = [decoder decodeObjectForKey:@"username"];
        self.token = [decoder decodeObjectForKey:@"token"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.img = [decoder decodeObjectForKey:@"img"];
        self.userid = [decoder decodeObjectForKey:@"userid"];
    }
    return self;
}


@end
