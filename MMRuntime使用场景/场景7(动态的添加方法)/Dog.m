//
//  Dog.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "Dog.h"
#import <objc/runtime.h>

@implementation Dog

// 默认方法都有两个隐式参数，
void eat(id self,SEL sel){
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
    NSLog(@"动态添加了一个方法");

}

// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
// 刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == NSSelectorFromString(@"eat")) {
        // 注意:这里需要强转成IMP类型
        class_addMethod(self, sel, (IMP)eat, "v@:");
        return YES;
    }
    // 先恢复, 不然会覆盖系统的方法
    return [super resolveInstanceMethod:sel];
}

@end
