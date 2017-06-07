//
//  MMPushController.m
//  MMRuntime使用场景
//
//  Created by mengxuanlong on 17/6/7.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "MMPushController.h"
#import "MMRuntimeController.h"

@interface MMPushController ()

@end

@implementation MMPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self pushRuntime];
}
- (void)pushRuntime {
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(0, 80, 300, 60);
    [pushBtn setTitle:@"点击我" forState:UIControlStateNormal];
    [pushBtn setBackgroundColor: [UIColor grayColor]];
    [pushBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
    [pushBtn addTarget:self action:@selector(pushFilmIndexClick) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - 正常的push
- (void)pushFilmIndexClick {
    
    MMRuntimeController *vc = [[MMRuntimeController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
