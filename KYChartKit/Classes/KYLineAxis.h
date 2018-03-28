//
//  KYLineAxis.h
//  KYChartKit
//
//  Created by yxf on 2018/3/27.
//

#import <Foundation/Foundation.h>

@interface KYLineAxis : NSObject

/** 单位*/
@property(nonatomic,assign)float unit;

/** 比例尺(实际尺寸:在app中的尺寸)*/
@property(nonatomic,assign)float scale;

/** 起始偏移量*/
@property(nonatomic,assign)float originOffset;

/** 名称*/
@property(nonatomic,copy)NSString *name;

@end
