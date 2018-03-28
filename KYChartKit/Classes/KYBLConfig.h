//
//  KYBLConfig.h
//  KYChartKit
//
//  Created by yxf on 2018/3/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KYBLConfig : NSObject

/** color*/
@property(nonatomic,strong)UIColor *lineColor;

/** width*/
@property(nonatomic,assign)float lineWidth;

/** origin*/
@property(nonatomic,assign)CGPoint originPoint;

@end
