//
//  ViewController.m
//  CustomActionSheet
//
//  Created by yaoqi on 16/4/11.
//  Copyright © 2016年 . All rights reserved.
//

#import "ViewController.h"
#import "SHActionSheetView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义弹出框";
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSheetButtonClicked:(id)sender {
    [[SHActionSheetView sh_actionSheet] sh_addSureButtonTitle:@"自定义弹出框！自定义弹出框！自定义弹出框！" addSureButtonTitle:@"确定" addCancelButtonTitle:@"取消" sureHandler:^{
        NSLog(@"确定");
    } cancelHandler:^{
        NSLog(@"取消");
    }];
}

@end
