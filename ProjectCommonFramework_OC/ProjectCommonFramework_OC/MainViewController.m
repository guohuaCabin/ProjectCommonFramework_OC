//
//  MainViewController.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/6/3.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navTitle:@"MainVC" backType:BackType_PopVC rightTitle:@"哈哈"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
