//
//  fourController.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "fourController.h"
#import <objc/runtime.h>

@interface fourController ()

@end

@implementation fourController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"获取所有的私有属性和方法";

    //获取UIPageControl的私有属性和方法
    [self getAllIvar];
    
    [self getAllMethod];
}

#pragma mark - 获取所有的属性(包括私有的)
- (void)getAllIvar {
    unsigned int count = 0;
    //Ivar：定义对象的实例变量，包括类型和名字。
    //获取所有的属性(包括私有的)
    Ivar *ivars= class_copyIvarList([UIPageControl class], &count);
    for (int i = 0; i < count; i++) {
        //取出成员变量
        Ivar ivar = ivars[i];
        
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSLog(@"属性 --> %@ 和 %@",name,type);
        
    }
    
}
#pragma mark - 获取所有的方法(包括私有的)
- (void)getAllMethod {
    unsigned int count = 0;
    //获取所有的方法(包括私有的)
    Method *memberFuncs = class_copyMethodList([UIPageControl class], &count);
    for (int i = 0; i < count; i++) {
        
        SEL address = method_getName(memberFuncs[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(address) encoding:NSUTF8StringEncoding];
        
        NSLog(@"方法 : %@",methodName);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
