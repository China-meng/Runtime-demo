//
//  twoController.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/9.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "twoController.h"

@interface twoController ()

@end

@implementation twoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIImageView *subview = [[UIImageView alloc] initWithFrame:
                            CGRectMake(10.0f, 100.0f, 30.0, 30.0f)];
    //实际图片的名字是new_Cart
    [subview setImage:[UIImage imageNamed:@"Cart"]];
    [self.view addSubview:subview];


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
