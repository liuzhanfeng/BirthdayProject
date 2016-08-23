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
{
    
    DrawText *draw1;
    DrawText *draw2;
    DrawText *draw3;
    DrawText *draw4;

}
 @property (strong, nonatomic) UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ZFAVAudioManager manager] startPlay];



    NSArray *array = @[@"2016年7月28日",@"00:00:01",@"老婆",@"祝你生日快乐"];
    
    draw1 = [[DrawText alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    [self.view addSubview:draw1];
    [draw1 start:array[0]];
    
    draw4 = [[DrawText alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 150)];
    [self.view addSubview:draw4];
    
    draw2 = [[DrawText alloc] initWithFrame:CGRectMake(0,300, self.view.frame.size.width, 150)];
    [self.view addSubview:draw2];

    draw3 = [[DrawText alloc] initWithFrame:CGRectMake(0,450, self.view.frame.size.width, 150)];
    [self.view addSubview:draw3];
    
    NSString *s1 = array[0];
    NSString *s2 = array[1];
    NSString *s3 = array[2];
    NSString *s4 = array[3];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s1.length*0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [draw4 start:array[1]];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s2.length*0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [draw2 start:array[2]];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s3.length*0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [draw3 start:array[3]];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s4.length*0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self startTranssiton];
                });
            });
        });
    });
    
}

-(void)hiddenText{
    [UIView animateWithDuration:0.5 animations:^{
        draw1.hidden = 0.0;
        draw2.hidden = 0.0;
        draw3.hidden = 0.0;
        draw4.hidden = 0.0;
        [draw1 removeFromSuperview];
        [draw2 removeFromSuperview];
        [draw3 removeFromSuperview];
        [draw4 removeFromSuperview];
    }];
}

-(void)startTranssiton{
    [self hiddenText];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view addSubview:self.iconView];
        [self changeAnimation];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self changeAnimation];
        });
    });
}

-(void)changeAnimation{
    CATransition *ca=[CATransition animation];
    ca.type=@"cube";
    ca.subtype=kCATransitionFromLeft;
    ca.duration=2.0;
    [self.iconView.layer addAnimation:ca forKey:nil];
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:self.view.frame];
        _iconView.image = [UIImage imageNamed:@"5448056_tu5974_21"];
    }
    return _iconView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
