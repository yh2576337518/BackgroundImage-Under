//
//  ViewController.m
//  下拉背景图片
//
//  Created by tangtianshi on 2017/6/1.
//  Copyright © 2017年 YH. All rights reserved.
//

#import "ViewController.h"
#import "SAMeTableController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.backgroundColor = [UIColor redColor];
    myButton.frame = CGRectMake(100, 100, 100, 100);
    [myButton addTarget:self action:@selector(myClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
}


-(void)myClick{
    SAMeTableController * myView = [[SAMeTableController alloc]init];
    [self.navigationController pushViewController:myView animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
