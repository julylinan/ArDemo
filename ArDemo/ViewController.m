//
//  ViewController.m
//  ArDemo
//
//  Created by Tony Duan on 2017/3/8.
//  Copyright © 2017年 ChengduRuiMa. All rights reserved.
//

#import "ViewController.h"
#import "LFLivePreview.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[[LFLivePreview alloc] initWithFrame:self.view.bounds]];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
