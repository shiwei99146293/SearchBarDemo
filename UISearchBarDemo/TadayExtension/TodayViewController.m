//
//  TodayViewController.m
//  TadayExtension
//
//  Created by shiwei on 15/9/30.
//  Copyright © 2015年 ___Shiwei___. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.todayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, 100)];
    [self.todayView setUserInteractionEnabled:YES];
    [self.todayView setBackgroundColor:[UIColor clearColor]];
    for (int i=0; i<3; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*80+5*(i+1),10,80,80)];
        [imgView setUserInteractionEnabled:YES];
        UITapGestureRecognizer *grTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(open)];
        [imgView addGestureRecognizer:grTap];
        UIImage *image = [UIImage imageNamed:@"123.png"];
        [imgView setImage:image];
        [imgView setBackgroundColor:[UIColor greenColor]];
        [self.todayView addSubview:imgView];
    }
     
    [self.view addSubview:self.todayView];
}

-(void)open{
    NSURL *url = [NSURL URLWithString:@"TodayDemo://"];
    
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
