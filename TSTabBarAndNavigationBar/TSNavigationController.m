//
//  TSNavigationController.m
//  TSTabBarAndNavigationBar
//
//  Created by tunsuy on 29/3/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "TSNavigationController.h"

@interface TSNavigationController ()

@end

static NSInteger sysVersion;

@implementation TSNavigationController

+ (void)load {
    sysVersion = [[[UIDevice currentDevice] systemVersion] integerValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && sysVersion <7) {
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
}

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
//}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if ([[navigationController.viewControllers firstObject] isEqual:viewController]) {
            navigationController.interactivePopGestureRecognizer.enabled = NO;
        }else {
            navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
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
