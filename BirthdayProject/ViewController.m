//
//  ViewController.m
//  BirthdayProject
//
//  Created by Daisy on 16/8/20.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "ViewController.h"
#import "DrawText.h"
#import "ZFAVAudioManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawText *draw1;
    DrawText *draw2;
    DrawText *draw3;
    DrawText *draw4;

    NSArray *array = @[@"2016年7月28日",@"00:00:01",@"老婆",@"祝你生日快乐"];
    
    draw1 = [[DrawText alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    [self.view addSubview:draw1];
    [draw1 start:array[0]];
    
    draw4 = [[DrawText alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 150)];
    [self.view addSubview:draw4];
    [draw4 start:array[1]];

    
    draw2 = [[DrawText alloc] initWithFrame:CGRectMake(0,300, self.view.frame.size.width, 150)];
    [self.view addSubview:draw2];
    [draw2 start:array[2]];

    draw3 = [[DrawText alloc] initWithFrame:CGRectMake(0,450, self.view.frame.size.width, 150)];
    [self.view addSubview:draw3];
    [draw3 start:array[3]];
    
    [[ZFAVAudioManager manager] startPlay];
    


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
