//
//  MMRuntimeController.m
//  MMRuntime
//
//  Created by mengxuanlong on 17/5/9.
//  Copyright © 2017年 mengxuanlong. All rights reserved.
//

#import "MMRuntimeController.h"
#import "one1Controller.h"
#import "twoController.h"
#import "threeController.h"

#import "fourController.h"
#import "fiveController.h"
#import "sixController.h"
#import "sevenController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface MMRuntimeController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation MMRuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}
- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"MMRuntime";
    [self.view addSubview:self.tableView];

    _dataSource = @[@"1.动态给分类添加属性",
                    @"2.方法的交换swizzling",
                    @"3.字典转模型",
                    @"4.获取所有的私有属性和方法",
                    @"5.对私有属性修改",
                    @"6.归档解档",
                    @"7.动态添加方法"
                    ];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            one1Controller *one = [[one1Controller alloc]init];
            [self.navigationController pushViewController:one animated:YES];
            break;
        }
        case 1:{
            twoController *two = [[twoController alloc]init];
            [self.navigationController pushViewController:two animated:YES];
            break;
        }
        case 2:{
            //字典转模型
            threeController *three = [[threeController alloc]init];
            [self.navigationController pushViewController:three animated:YES];
            break;
        }
        case 3:{
            //获取所有的私有属性和方法
            fourController *four = [[fourController alloc]init];
            [self.navigationController pushViewController:four animated:YES];
            break;
        }
            
        case 4:{
            //对私有属性修改
            fiveController *five = [[fiveController alloc]init];
            [self.navigationController pushViewController:five animated:YES];
            break;
        }
        case 5:{
            //归档解档
            sixController *six = [[sixController alloc]init];
            [self.navigationController pushViewController:six animated:YES];
            break;//
        }
            
        case 6:{
            //动态添加方法
            sevenController *seven = [[sevenController alloc]init];
            [self.navigationController pushViewController:seven animated:YES];
            break;
        }

            
        default:
            break;
    }

}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
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
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //2. 判断是否有可重用的，如果没有，则自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    cell.textLabel.text = _dataSource[indexPath.row];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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
