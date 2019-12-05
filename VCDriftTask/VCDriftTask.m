//
//  VCDriftTask.m
//  VCDriftTask
//
//  Created by 志刚杨 on 2019/12/5.
//  Copyright © 2019 志刚杨. All rights reserved.
//

#import "VCDriftTask.h"

@implementation VCDriftTask

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isRuning = NO;
        _taskType = VCDriftTaskTypeAuto;
    }
    return self;
}

-(void)addTask:(VCDriftTaskModel *)model
{
    [self.taskArray addObject:model];
    [self tryExecTask];
}

- (void)tryExecTask {
    
    if(_isRuning || !self.taskArray.count)
    {
        return;
    }
    
    
    if([self.delegate respondsToSelector:@selector(VCDriftTaskExec:)])
    {
        
        //当前没有执行的任务直接执行
        _isRuning = YES;
        [self.delegate VCDriftTaskExec:self.taskArray[0]];
        
        if(self.taskType == VCDriftTaskTypeAuto)
        {
            //自动计算时间到下一个队列
            [self autoExec];
        }
        else if(self.taskType == VCDriftTaskTypeManual)
        {
            //等待手动关闭
            NSLog(@"队列等待关闭中");
        }
    }
    else
    {
        NSLog(@"未实现代理方法");
    }
}


-(void)endTack:(VCDriftTaskModel *)model
{
    if([self.delegate respondsToSelector:@selector(VCDriftTaskComplete:)])
    {
        [self.delegate VCDriftTaskComplete:model];
    }
}

- (void)autoExec {
    
    
    
    __weak __typeof(self)weakSelf = self;
    VCDriftTaskModel *execModel = self.taskArray.mutableCopy[0];
    
    [self.taskArray removeObjectAtIndex:0];

    //等待个几秒执行下次任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(execModel.executionTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.isRuning = NO;
        [weakSelf endTack:execModel];
        if(self.taskArray.count != 0)
        {
            [weakSelf tryExecTask];
        }
    
    });
}

- (void)manualExec
{
    VCDriftTaskModel *execModel = self.taskArray.mutableCopy[0];
    [self endTack:execModel];
    _isRuning = NO;
    [self.taskArray removeObjectAtIndex:0];
    [self tryExecTask];
    
}
-(NSMutableArray<VCDriftTaskModel *> *)taskArray
{
    if(_taskArray == nil)
    {
        _taskArray = [NSMutableArray array];
    }
    
    return _taskArray;
}
@end
