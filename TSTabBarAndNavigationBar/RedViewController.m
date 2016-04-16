//
//  RedViewController.m
//  TSTabBarAndNavigationBar
//
//  Created by tunsuy on 28/3/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "RedViewController.h"
#import "OrangeViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    pushBtn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    pushBtn.backgroundColor = [UIColor blackColor];
    pushBtn.layer.cornerRadius = 10;
    pushBtn.clipsToBounds = YES;
    [pushBtn addTarget:self action:@selector(pushToOrangeVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}


- (void)pushToOrangeVC:(UIButton *)sender {
    OrangeViewController *orangeVC = [[OrangeViewController alloc] init];
    [self.navigationController pushViewController:orangeVC animated:YES];
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
