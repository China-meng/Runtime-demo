//
//  MMNavController.m
//  MMRuntime使用场景
//
//  Created by mengxuanlong on 17/6/7.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "MMNavController.h"

@interface MMNavController ()<UIGestureRecognizerDelegate>

@end

@implementation MMNavController

//自定义了leftBarButtonItem 侧滑返回失效
- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate =  self;
    
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1 ) {
        return NO;
    }
    
    return YES;
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
