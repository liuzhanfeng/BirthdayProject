//
//  DrawText.m
//  BirthdayProject
//
//  Created by LZF on 16/8/22.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "DrawText.h"
#import "UIBezierPath+ZJText.h"
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

@interface DrawText()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSMutableDictionary *attrs;

@end

@implementation DrawText

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.layer addSublayer:self.shapeLayer ];
        
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

    }
    return self;
}

-(void)start:(NSString *)text{
    
    if (text.length < 1) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath zjBezierPathWithText:text attributes:self.attrs];
    self.shapeLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    self.shapeLayer.path = path.CGPath;
    
    [self.shapeLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.7f * text.length;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];

}

-(CAShapeLayer *)shapeLayer
{
    if (_shapeLayer == nil)
    {
        _shapeLayer = [CAShapeLayer layer];
        
        CGSize size = self.frame.size;
        CGFloat height = 250;
        
        _shapeLayer.frame = CGRectMake(0, (size.height - height)/2, size.width , height);
        _shapeLayer.geometryFlipped = YES;
        _shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;;
        _shapeLayer.lineWidth = 2.0f;
        _shapeLayer.lineJoin = kCALineJoinRound;
    }
    return _shapeLayer;
}

-(NSMutableDictionary *)attrs
{
    if (_attrs == nil)
    {
        _attrs = [[NSMutableDictionary alloc] init];
        
        [_attrs setValue:[UIFont systemFontOfSize:30] forKey:NSFontAttributeName];
    }
    return _attrs;
}

@end
