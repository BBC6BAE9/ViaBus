//
//  VBViewController.m
//  ViaBus
//
//  Created by bbc6bae9 on 07/27/2021.
//  Copyright (c) 2021 bbc6bae9. All rights reserved.
//

#import "VBViewController.h"
#import "ViaBus.h"

#define HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WIDTH [[UIScreen mainScreen] bounds].size.width

@interface VBViewController ()

@end

@implementation VBViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIButton *pubBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
    [pubBtn addTarget:self action:@selector(publishBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    [pubBtn setTitle:@"broadcast" forState:UIControlStateNormal];
    pubBtn.titleLabel.font = [UIFont systemFontOfSize:50];
    pubBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pubBtn];
    
    UIButton *subBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 100)];
    [subBtn addTarget:self action:@selector(subcribeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [subBtn setTitle:@"subscribe" forState:UIControlStateNormal];
    [subBtn setTitle:@"unsubscribe" forState:UIControlStateSelected];
    subBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:subBtn];
}

- (void)subcribeBtnClick:(UIButton*)sender{
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        NSLog(@"订阅了");
        [VIABUS subscribeEventWithEventname:@"broadcast" andTaget:self handler:^(NSString * eventName, id object) {
            NSLog(@"收到通知");
        }];
    }else{
        NSLog(@"取消订阅了");
        [VIABUS unsubscribeEventWithEventName:@"broadcast" target:self];
    }
}

- (void)publishBtnClick:(UIButton*)sender{
    [VIABUS publishNotification:@"broadcast" broadcastContent:@"I love Kobe"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
