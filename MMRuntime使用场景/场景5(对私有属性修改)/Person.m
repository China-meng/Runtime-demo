//
//  Person.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "Person.h"
@interface Person()
@property (nonatomic,copy) NSString *address;

@end
@implementation Person
- (instancetype)init {
    self = [super init];
    if (self) {
        _address = @"私有属性北京";
        self.name = @"孟孟";
    }
    return self;
}
//公共方法
- (void)publicMethod {
    NSLog(@"对外暴露的方法 %@",self.address);
}
//私有方法
- (void)privateMethod {
    NSLog(@"私有方法%@",self.name);
}
- (NSString *)description {
    return [NSString stringWithFormat:@" %@,  %@",self.address,self.name];
}
@end
