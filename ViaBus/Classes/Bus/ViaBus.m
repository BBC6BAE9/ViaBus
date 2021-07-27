//
//  EventBus.m
//  HHEventBus
//
//  Created by huanghong on 2019/11/22.
//  Copyright © 2019 huang. All rights reserved.
//

#import "ViaBus.h"
#import "NSObject+RFDestoryNotify.h"

static ViaBus * _instance = nil;

@interface ViaBus()

@property(nonatomic, strong) NSMutableArray *registList; // 注册数组

@end

@implementation ViaBus

+ (instancetype)sharedInstance {
    if (!_instance) {
        _instance = [[super allocWithZone:NULL] init] ;
    }
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [ViaBus sharedInstance] ;
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return [ViaBus sharedInstance];
}

// 初始化方法
- (instancetype)init{
    if ([super init]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.registList = @[].mutableCopy;
}

/// 发送通知
/// @param eventName 事件名称
- (void)publishNotification:(NSString *)eventName{
    [self publishNotification:eventName broadcastContent:nil];
}

/// 发送通知
/// @param eventName 事件名称
/// @param broadcastContent 广播内容
- (void)publishNotification:(NSString *)eventName broadcastContent:(id)broadcastContent{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:eventName object:broadcastContent];
    });
}

// 订阅某一事件
- (void)subscribeEventWithEventname:(NSString *)name andTaget:(id _Nonnull)target handler:(handler)handler{
    
    if (!(name && name.length>0 && handler)){
        return;
    }
    
    // 如果有相同名称的监听，就不要继续添加监听了
    if ([self eventNeedRegist:name]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:name object:nil];
    }
    
    NSString *identifier = [NSString stringWithFormat:@"%p_%@",&target, name];
    NSDictionary *valueDic = @{
        @"identifier":identifier, // identifier 是每一个监听的标识符
        @"handler":handler // handler 唯一标识符对应的回调
    };
    [self.registList addObject:valueDic];
    
    __weak typeof(self) weakSelf = self;
    // target 实例被释放
    [target rfDestoryNotifySetName:identifier userInfo:valueDic block:^(RFDestoryNotify *notify) {
        if (notify.name) {
            NSString *identifier = notify.name;
            NSString *name = [identifier componentsSeparatedByString:@"_"].lastObject;
            [weakSelf deleteRegitserArrElementWithIdentifier:identifier];
            if ([weakSelf isExistEvent:name]) return; // 如果这个eventName还存在说明当前还需要监听，不需要移除
            [[NSNotificationCenter defaultCenter] removeObserver:weakSelf name:name object:nil];
        }
    }];
    
}

// Notification
- (void)noti:(NSNotification *)not {
    if (not) {
        NSString *name = not.name;
        for (NSDictionary *dic in self.registList) {
            handler handler = dic[@"handler"];
            handler(name, not.object);
        }
    }
}

- (void)unsubscribeEventWithEventName:(NSString *)eventName target:(id)target{
    NSString *identifier = [NSString stringWithFormat:@"%p_%@",&target, eventName];
    NSString *name = eventName;
    [self deleteRegitserArrElementWithIdentifier:identifier];
    if ([self isExistEvent:name]) return; // 如果这个eventName还存在说明当前还需要监听，不需要移除
    [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
}

// 根据唯一标识符删除注册
- (void)deleteRegitserArrElementWithIdentifier:(NSString *)identifier{
    NSMutableArray *tempArr = @[].mutableCopy;
    for (int i = 0; i<self.registList.count; i++) {
        NSDictionary *dic = self.registList[i];
        NSString *tempStr = dic[@"identifier"];
        if (![identifier isEqualToString:tempStr]) [tempArr addObject:dic];
    }
    self.registList = tempArr;
}


// 是否需要注册监听
- (BOOL)eventNeedRegist:(NSString *)eventName{
    return ![self isExistEvent:eventName];
}

// 当前注册表中是否存在事件名称为eventName的注册
- (BOOL)isExistEvent:(NSString *)eventName{
    BOOL isExist = NO;
    for (NSDictionary *dic in self.registList) {
        if ([eventName isEqualToString:dic[@"eventName"]]) isExist = YES;
    }
    return isExist;
}

@end
