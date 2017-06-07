//
//  sixController.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/10.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "sixController.h"
#import "MMModel.h"

@interface sixController ()

@end

@implementation sixController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    MMModel *model = [[MMModel alloc] init];
    model.age = 12;
    model.name1 = @"http://www.zhongguolong.cn";
    model.name2 = @"mengmeng";
    model.name3 = @"NBA";
    
    //创建路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    NSLog(@"documents路径：%@",documentPath);
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"MMModel.data"];
    
    //存储用户信息,归档
    
    BOOL result = [NSKeyedArchiver archiveRootObject:model toFile:filePath];
    
    if (result) {
        NSLog(@"归档成功:%@",filePath);
    }else{
        NSLog(@"归档失败");
    }
    
    MMModel *mm = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%ld",(long)mm.age);
    NSLog(@"%@",mm.name1);
    NSLog(@"%@",mm.name2);

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
