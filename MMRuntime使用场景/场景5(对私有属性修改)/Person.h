//
//  Person.h
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString *name;
//公共的
- (void)publicMethod;
@end
