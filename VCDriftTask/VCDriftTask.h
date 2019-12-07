//
//  VCDriftTask.h
//  VCDriftTask
//
//  Created by 志刚杨 on 2019/12/5.
//  Copyright © 2019 志刚杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCDriftTaskModel.h"
NS_ASSUME_NONNULL_BEGIN

//NS_ENUM，队列类型
typedef NS_ENUM(NSUInteger, VCDriftTaskType) {
    VCDriftTaskTypeAuto  = 0,//给每个model设置一个时间，系统判断自动调用，适用于明确时间的任务
    VCDriftTaskTypeManual,//手动管理每个任务的结束，适用于不确定任务何时结束或者时间不确定的任务
};
@protocol VCDriftTaskDelegate <NSObject>
@required
//在这里执行你想要的任务
-(void)VCDriftTaskExec:(VCDriftTaskModel *)model;

@optional
//某个任务结束回调
-(void)VCDriftTaskComplete:(VCDriftTaskModel *)model;
@end

@interface VCDriftTask : NSObject

/// 队列列表
@property(nonatomic, strong) NSMutableArray<VCDriftTaskModel *> *taskArray;

/// 任务是否在运行
@property(nonatomic, assign) BOOL isRuning;

/// 添加一个任务
/// @param model dataModel

-(void)addTask:(VCDriftTaskModel *)model;

/// 任务类型，默认 VCDriftTaskTypeAuto
@property(nonatomic, assign) VCDriftTaskType taskType;
@property(nonatomic, strong) id<VCDriftTaskDelegate> delegate;

//手动任务调用
- (void)manualExec;
@end

NS_ASSUME_NONNULL_END
