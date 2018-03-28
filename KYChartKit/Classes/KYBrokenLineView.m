//
//  KYBrokenLineView.m
//  KYChartKit
//
//  Created by yxf on 2018/3/27.
//

#import "KYBrokenLineView.h"
#import "KYBLConfig.h"
#import "KYLineAxis.h"

@interface KYBrokenLineView ()

/** duration*/
@property(nonatomic,assign)float duration;

@end

@implementation KYBrokenLineView


#pragma mark - public func
-(void)drawBrokenLineView{
    [self drawBrokenLineViewWithAnimationTime:0];
}

-(void)drawBrokenLineViewWithAnimationTime:(float)duration{
    _duration = duration;
    [self drawLine];
}

#pragma mark - custom func
/** 画折线 */
-(void)drawLine{
    if (self.points.count > 0) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        //转换坐标
        for (int i=0; i<self.points.count; i++) {
            NSNumber *value = self.points[i];
            CGPoint originValue = [value CGPointValue];
            CGFloat x = (originValue.x - self.xAxis.originOffset) / self.xAxis.scale + self.xAxis.originOffset;
            CGFloat y = (originValue.y - self.yAxis.originOffset) / self.yAxis.scale + self.yAxis.originOffset;
            CGPoint point = CGPointMake(x, CGRectGetHeight(self.frame) - y);
            if (i>0) {
                [path addLineToPoint:point];
            }else{
                [path moveToPoint:point];
            }
        }
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.lineWidth = self.config.lineWidth;
        shapeLayer.strokeColor = self.config.lineColor.CGColor;
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        
        [self.layer addSublayer:shapeLayer];
        
        //展示动画
        if (self.duration > 0) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            animation.duration = self.duration;
            animation.fromValue = @0;
            animation.toValue = @1.0;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            animation.removedOnCompletion = YES;
            [shapeLayer addAnimation:animation forKey:@"ky_lineShow"];
        }
        
    }
}

#pragma mark - setter


#pragma mark - getter
-(KYBLConfig *)config{
    if (!_config) {
        _config = [[KYBLConfig alloc] init];
        _config.lineColor = [UIColor redColor];
        _config.lineWidth = 1.0f;
        _config.originPoint = CGPointMake(40, CGRectGetHeight(self.frame) - 40);
    }
    return _config;
}

-(KYLineAxis *)xAxis{
    if (!_xAxis) {
        _xAxis = [[KYLineAxis alloc] init];
        _xAxis.unit = 10;
        _xAxis.scale = 1;
        _xAxis.originOffset = 0;
        _xAxis.name = @"x轴";
    }
    return _xAxis;
}

-(KYLineAxis *)yAxis{
    if (!_yAxis) {
        _yAxis = [[KYLineAxis alloc] init];
        _yAxis.unit = 10;
        _yAxis.scale = 1;
        _yAxis.originOffset = 0;
        _yAxis.name = @"y轴";
    }
    return _yAxis;
}


@end
