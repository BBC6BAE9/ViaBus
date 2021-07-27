//
//  BBEventBus.h
//  HHEventBus
//
//  Created by huanghong on 2019/11/22.
//  Copyright © 2019 bobo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define VIABUS [ViaBus sharedInstance]
typedef void (^handler)(NSString *eventName ,id object);

@interface ViaBus : NSObject

/// 单例
+ (instancetype)sharedInstance;

/// 发布广播
/// @param eventName 事件名称
- (void)publishNotification:(NSString *)eventName;

/// 发布广播
/// @param eventName 事件名称
/// @param broadcastContent 广播内容
- (void)publishNotification:(NSString *)eventName broadcastContent:(id)broadcastContent;

/// 订阅消息
/// @param eventName 事件名称
/// @param target 注册事件通知的收信人
/// @param handler 处理handler
- (void)subscribeEventWithEventname:(NSString *)eventName andTaget:(id _Nonnull)target handler:(handler)handler;

/// 取消订阅
/// @param eventName 事件名称
/// @param target 注册事件通知的收信人
- (void)unsubscribeEventWithEventName:(NSString *)eventName target:(id)target;
@end

NS_ASSUME_NONNULL_END
