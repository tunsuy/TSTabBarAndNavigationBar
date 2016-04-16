//
//  TSTabBarController.m
//  TSTabBarAndNavigationBar
//
//  Created by tunsuy on 28/3/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "TSTabBarController.h"
#import "RedViewController.h"
#import "GreenViewController.h"
#import "BlueViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define kTabBarItemTag 1000

@interface TSTabBarController ()

@property (nonatomic, strong) UIView *tabBarView;

@end

@implementation TSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }else {
        return YES;
    }
}

- (void)setTabBarController {
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
    self.viewControllers = @[[[RedViewController alloc] init],
                             [[GreenViewController alloc] init],
                             [[BlueViewController alloc] init]];
    
    [self generateTabBarItemWithViewControllers:self.viewControllers];
}

- (void)generateTabBarItemWithViewControllers:(NSArray *)viewControllers {

    
    if (_tabBarView) {
        [_tabBarView removeFromSuperview];
    }
    _tabBarView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    _tabBarView.backgroundColor = [UIColor colorWithRed:0.2 green:0.16 blue:0.2 alpha:1.0];
    
    NSArray *tabBarItemInfoArray = @[@{@"title":@"红色"},
                                     @{@"title":@"绿色"},
                                     @{@"title":@"蓝色"}];
    
    NSUInteger tabBarItemCount = viewControllers.count;
    for (int i=0; i<tabBarItemCount; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/tabBarItemCount*i, 0, SCREEN_WIDTH/tabBarItemCount, _tabBarView.frame.size.height)];
        [btn setTitle:tabBarItemInfoArray[i][@"title"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.4] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.9] forState:UIControlStateSelected];
        btn.tag = kTabBarItemTag + i;
        [btn addTarget:self action:@selector(tabBarItemBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:btn];
    }
    
    [self.tabBar addSubview:_tabBarView];
    
}

- (void)tabBarItemBtnPress:(UIButton *)sender {
    UIButton *btn = (UIButton *)sender;
    self.selectedIndex = btn.tag - kTabBarItemTag;
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
