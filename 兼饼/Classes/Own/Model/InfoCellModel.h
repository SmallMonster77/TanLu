//
//  InfoCellModel.h
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/13.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoCellModel : NSObject

@property(nonatomic,copy) NSString *imageName;
@property(nonatomic,copy) NSString *title;

-(InfoCellModel *)initWithImageName:(NSString *)imageName title:(NSString *)title;

@end
