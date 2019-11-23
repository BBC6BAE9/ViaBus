//
//  BBEventBus.h
//  HHEventBus
//
//  Created by huanghong on 2019/11/22.
//  Copyright © 2019 bobo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define BBEVENTBUS [BBEventBus sharedInstance]
typedef void (^handler)(NSString *eventName ,id object);

@interface BBEventBus : NSObject

/** 单例 */
+ (instancetype)sharedInstance;

/**
 订阅消息

 @param name 事件名称
 @param target 注册事件通知的收信人
 @param handler 处理handler
 */
- (void)subscribeEventWithEventname:(NSString *)name andTaget:(id _Nonnull)target handler:(handler)handler;

@end

NS_ASSUME_NONNULL_END
