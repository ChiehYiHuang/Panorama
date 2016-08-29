//
//  ViewController.m
//  Panorama
//
//  Created by Rebecca on 2016/8/29.
//  Copyright © 2016年 Rebecca. All rights reserved.
//

#import "ViewController.h"
#import "BrowserViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Override
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CGRect rect;
    UIButton *button;
    
    rect = CGRectMake(0, 0, 200, 100);
    button = [[UIButton alloc] initWithFrame:rect];
    [[button layer] setCornerRadius:10];
    [[button layer] setBorderWidth:2];
    [[button layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:@"Check it out!" forState:UIControlStateNormal];
    [button setCenter:self.view.center];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(onClickBrowserBtn:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events functions
- (void)onClickBrowserBtn:(UIButton *)aButton {
    BrowserViewController *controller = [[BrowserViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
