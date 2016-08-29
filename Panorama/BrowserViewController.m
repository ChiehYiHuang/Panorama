//
//  BrowserViewController.m
//  Panorama
//
//  Created by Rebecca on 2016/8/29.
//  Copyright © 2016年 Rebecca. All rights reserved.
//

#import "BrowserViewController.h"

@implementation BrowserViewController
#pragma mark - Override
- (void)loadView {
    [super loadView];
    CGRect rect;
    
    // init Panorama View
    rect = CGRectMake(0, 0, 768, 1024);
    JAPanoView *panoView = [[JAPanoView alloc] initWithFrame:rect];
    self.view = panoView;
    
    panoView.delegate = self;
    
    // Default Image
    [panoView setFrontImage:[UIImage imageNamed:@"TowerHousepano_f.jpg"]
                 rightImage:[UIImage imageNamed:@"TowerHousepano_r.jpg"]
                  backImage:[UIImage imageNamed:@"TowerHousepano_b.jpg"]
                  leftImage:[UIImage imageNamed:@"TowerHousepano_l.jpg"]
                   topImage:[UIImage imageNamed:@"TowerHousepano_u.jpg"]
                bottomImage:[UIImage imageNamed:@"Down_fixed.jpg"]];
    
    // China Image
    //    [panoView setFrontImage:[UIImage imageNamed:@"asquare.front.jpg"]
    //                 rightImage:[UIImage imageNamed:@"asquare.right.jpg"]
    //                  backImage:[UIImage imageNamed:@"asquare.back.jpg"]
    //                  leftImage:[UIImage imageNamed:@"asquare.left.jpg"]
    //                   topImage:[UIImage imageNamed:@"asquare.up.jpg"]
    //                bottomImage:[UIImage imageNamed:@"asquare.down.jpg"]];
    
    // hotspot1 - show hotspot mark
    rect = CGRectMake(0, 0, 100, 25);
    UILabel *hotspot1 = [[UILabel alloc] initWithFrame:rect];
    hotspot1.backgroundColor = [UIColor clearColor];
    hotspot1.textColor = [UIColor redColor];
    hotspot1.text = @"DOOR";
    hotspot1.textAlignment = NSTextAlignmentCenter;
    [panoView addHotspot:hotspot1 atHAngle:0 vAngle:0];
    
    // hotspot2 - show for TapGesture event
    rect = CGRectMake(0, 0, 50, 50);
    UIView *hotspot2 = [[UIView alloc] initWithFrame:rect];
    hotspot2.backgroundColor = [UIColor yellowColor];
    hotspot2.alpha = 0.5;
    hotspot2.layer.cornerRadius = 25;
    [panoView addHotspot:hotspot2 atHAngle:M_PI_4 vAngle:M_PI_4];
    
    UITapGestureRecognizer *tapgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotspot2Tapped:)];
    [hotspot2 addGestureRecognizer:tapgr];
    
    // hotspot3 - show for button event
    rect = CGRectMake(0, 0, 100, 30);
    UIButton *hotspot3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hotspot3 setTitle:@"clouds" forState:UIControlStateNormal];
    [hotspot3 setFrame:rect];
    hotspot3.shouldApplyPerspective = NO;
    [hotspot3 addTarget:self
                 action:@selector(onCenterCloudsClick:)
       forControlEvents:UIControlEventTouchUpInside];
    [panoView addHotspot:hotspot3 atHAngle:-M_PI_2 vAngle:M_PI_4];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Click the Button can pop to last page
    CGRect rect = CGRectMake(10, 20, 100, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    button.layer.cornerRadius = 10;
    button.layer.borderColor = [[UIColor grayColor] CGColor];
    button.layer.borderWidth = 2;
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"Last Page" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClickLastPageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Event
- (void)onClickLastPageBtn:(UIButton *)aButton {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)onCenterCloudsClick:(UIButton *)aButton {
    NSLog(@"onCenterCloudsClick");
    
    // move to center
    [(JAPanoView *)self.view setHAngle:-M_PI_2];
    [(JAPanoView *)self.view setVAngle:M_PI_4];
}
- (void)hotspot2Tapped:(UITapGestureRecognizer *)aTap {
    NSLog(@"hotspot2Tapped");
}

#pragma mark JAPanoViewDelegate
// when you move the View
- (void)panoViewDidPan:(JAPanoView *)panoView {
        NSLog(@"didPan");
}
// when you stop moving the View
- (void)panoViewDidEndPanning:(JAPanoView *)panoView {
        NSLog(@"didEndPanning");
}

@end
