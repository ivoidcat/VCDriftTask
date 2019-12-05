//
//  DriftTaskModel.h
//  VCDriftTask
//
//  Created by 志刚杨 on 2019/12/5.
//  Copyright © 2019 志刚杨. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCDriftTaskModel : NSObject

/// 队列执行时间，默认5秒，手动模式下无效

@property(nonatomic, assign) NSInteger executionTime;

//数据模型，回调用
@property(nonatomic, strong) id dataModel;

//自定义tag可选
@property(nonatomic, strong) NSString *tags;
@end

NS_ASSUME_NONNULL_END
