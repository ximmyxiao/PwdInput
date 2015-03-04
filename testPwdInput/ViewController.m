//
//  ViewController.m
//  testPwdInput
//
//  Created by Piao Piao on 15/3/3.
//  Copyright (c) 2015年 Piao Piao. All rights reserved.
//

#import "ViewController.h"
#import "PwdInput.h"

@interface ViewController ()<PwdInputDelegate>
@property(nonatomic,strong) UILabel* tipsLabel;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    PwdInput* input = [[PwdInput alloc] initWithFrame:CGRectMake(0, 0, 200, 50) andColumeCount:4];
    input.center = self.view.center;
    input.inputDelegate = self;
    [self.view addSubview:input];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 200, 40)];
    self.tipsLabel.text = @"  input:";
    [self.view addSubview:self.tipsLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didInputText:(NSString *)text
{
    self.tipsLabel.text = [NSString stringWithFormat:@"  input:%@", text];
}

@end
