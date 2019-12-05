//
//  DriftTaskModel.m
//  VCDriftTask
//
//  Created by 志刚杨 on 2019/12/5.
//  Copyright © 2019 志刚杨. All rights reserved.
//

#import "VCDriftTaskModel.h"


@implementation VCDriftTaskModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _executionTime = 5;
    }
    return self;
}
@end
