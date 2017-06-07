//
//  UINavigationBar+alpha.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/9.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "UINavigationBar+alpha.h"
#import <objc/runtime.h>

@implementation UINavigationBar (alpha)
//定义一个内存存储块(对象),去存储对象的数据
static char alView;

//get方法
-(UIView *)alphaView {
    return objc_getAssociatedObject(self, &alView);
}

//set方法
-(void)setAlphaView:(UIView *)alphaView {
    objc_setAssociatedObject(self, &alView, alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//通过这个方法去改变颜色和透明度
-(void)alphaNavigationBarView:(UIColor *)color {
    //懒加载
    if (!self.alphaView) {
        //0设置一张图片(这张图片没有大小:空的)
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        //1创建(自定义的view 会盖住navigationBar)
        self.alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, -20,[UIScreen mainScreen].bounds.size.width , 64)];
        
        //2添加到navigationbar
        [self insertSubview:self.alphaView atIndex:0];
    }
    [self.alphaView setBackgroundColor:color];
}
@end
