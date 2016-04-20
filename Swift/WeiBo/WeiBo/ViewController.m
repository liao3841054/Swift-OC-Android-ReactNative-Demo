//
//  ViewController.m
//  WeiBo
//
//  Created by 益平廖 on 16/4/20.
//  Copyright © 2016年 Liaoyp. All rights reserved.
//

#import "ViewController.h"
#import "WeiboArticleViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma private

- (void)buttonClicked:(UIButton *)button
{
    WeiboArticleViewController *articleVc = [[WeiboArticleViewController alloc] init];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:articleVc] animated:YES completion:^{
        
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 44);
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"写文章" forState:UIControlStateNormal];
    button.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2 );
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
