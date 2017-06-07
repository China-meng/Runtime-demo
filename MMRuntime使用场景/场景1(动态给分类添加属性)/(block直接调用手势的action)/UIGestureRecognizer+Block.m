//
//  UIGestureRecognizer+Block.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (Block)

static const int target_key;

+ (instancetype)mm_gestureRecognizerWithActionBlock:(MMGestureBlock)block {
    __typeof(self) weakSelf = self;
    return [[weakSelf alloc]initWithActionBlock:block];



}
- (instancetype)initWithActionBlock:(MMGestureBlock)block {
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

- (void)addActionBlock:(MMGestureBlock)block {
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender {
    MMGestureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}

@end
