//
//  WebViewController.m
//  BirthdayProject
//
//  Created by LZF on 16/8/23.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.backgroundColor = RGBColor(198, 161, 223);
    self.button.layer.cornerRadius = 15;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@""]];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)buttonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
