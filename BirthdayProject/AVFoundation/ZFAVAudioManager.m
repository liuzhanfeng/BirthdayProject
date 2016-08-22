//
//  ZFAVAudioManager.m
//  BirthdayProject
//
//  Created by Daisy on 16/8/20.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "ZFAVAudioManager.h"
#import <AVFoundation/AVFoundation.h>

@interface ZFAVAudioManager()
@property(nonatomic,strong)AVAudioPlayer *avplay;
@end

@implementation ZFAVAudioManager
+ (instancetype)manager {
    static ZFAVAudioManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)startPlay{
    [self.avplay play];
}

-(AVAudioPlayer *)avplay{
    if (!_avplay) {
        NSString *urlStr=[[NSBundle mainBundle]pathForResource:@"audio_hanyu" ofType:@"mp3"];
        NSURL *url=[NSURL fileURLWithPath:urlStr];
        NSError *error=nil;
        _avplay = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        
    }
    return _avplay;
}

@end
