//
//  KYBrokenLineView.h
//  KYChartKit
//
//  Created by yxf on 2018/3/27.
//

#import <UIKit/UIKit.h>

@class KYBLConfig,KYLineAxis;

@interface KYBrokenLineView : UIView

/** points*/
@property(nonatomic,strong)NSArray<NSNumber *> *points;

/** config*/
@property(nonatomic,strong)KYBLConfig *config;

/** x axis*/
@property(nonatomic,strong)KYLineAxis *xAxis;

/** y axis*/
@property(nonatomic,strong)KYLineAxis *yAxis;

/** 画折线图 */
-(void)drawBrokenLineView;


/**
 画折线图

 @param duration 动画持续的时间
 */
-(void)drawBrokenLineViewWithAnimationTime:(float)duration;

@end
