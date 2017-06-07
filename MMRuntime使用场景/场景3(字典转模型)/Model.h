//
//  Model.h
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/9.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+hook.h"

@interface Model : NSObject
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *sex;

@property (copy,nonatomic) NSString *age;

@end
