//
//  UIGestureRecognizer+Block.h
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MMGestureBlock)(id gestureRecognizer);

@interface UIGestureRecognizer (Block)

+ (instancetype)mm_gestureRecognizerWithActionBlock:(MMGestureBlock)block;

@end
