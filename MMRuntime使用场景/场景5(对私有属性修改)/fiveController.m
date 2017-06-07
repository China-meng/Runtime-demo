//
//  fiveController.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "fiveController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface fiveController ()

@end

@implementation fiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"对私有变量的更改";

    self.view.backgroundColor = [UIColor whiteColor];

    //对私有变量的更改
    [self changePrivate];
    //获取所有的方法(包括私有的)
    [self getAllMethod];
}
#pragma mark - 对私有变量的更改
- (void)changePrivate {
    Person *onePerson = [[Person alloc] init];
    NSLog(@"Person属性 == %@",[onePerson description]);
    
    unsigned  int count = 0;
    Ivar *members = class_copyIvarList([Person class], &count);
    
    for (int i = 0; i < count; i++){
        Ivar var = members[i];
        const char *memberAddress = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var);
        NSLog(@"获取所有属性 = %s ; type = %s",memberAddress,memberType);
    }
    //对私有变量的更改
    Ivar m_address = members[1];
    object_setIvar(onePerson, m_address, @"上海");
    NSLog(@"对私有变量的(地址)进行更改 : %@",[onePerson description]);
    
}

#pragma mark - 获取所有的方法(包括私有的)
- (void)getAllMethod {
    unsigned int count = 0;
    //获取所有的方法(包括私有的)
    Method *memberFuncs = class_copyMethodList([Person class], &count);
    for (int i = 0; i < count; i++) {
        
        SEL address = method_getName(memberFuncs[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(address) encoding:NSUTF8StringEncoding];
        
        NSLog(@"所有的方法 : %@",methodName);
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
