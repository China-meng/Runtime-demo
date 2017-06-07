//
//  UINavigationBar+alpha.h
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/9.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (alpha)

//动态添加的UIview 添加到UINavigationBar 上
@property (nonatomic , strong)UIView *alphaView;
//提供一个方法,提供外界使用
- (void)alphaNavigationBarView:(UIColor *)color;
@end
