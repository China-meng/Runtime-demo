//
//  oneController.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/9.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "oneController.h"
#import "UINavigationBar+alpha.h"
#import "one1Controller.h"

@interface oneController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation oneController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    UIColor *color = [UIColor purpleColor];

    [self.navigationController.navigationBar alphaNavigationBarView:[color colorWithAlphaComponent:1]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.title = @"动态给分类添加属性";
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];
//    [self leftBackButton];


}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当前的y值
    CGFloat OffsetY = scrollView.contentOffset.y;
    
    UIColor *color = [UIColor purpleColor];
    
    CGFloat alpha = (30 + 64 - OffsetY)/64;
    if (OffsetY > 30) {
        
        [self.navigationController.navigationBar alphaNavigationBarView:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar alphaNavigationBarView:[color colorWithAlphaComponent:1]];
    }
    
    
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
    }
    return _tableView;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //2. 判断是否有可重用的，如果没有，则自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    cell.textLabel.text = @"这羡慕你们这些人, 年纪轻轻的就认识了才华横溢的我";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    one1Controller *one1 = [[one1Controller alloc]init];
    [self.navigationController pushViewController:one1 animated:YES];
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
