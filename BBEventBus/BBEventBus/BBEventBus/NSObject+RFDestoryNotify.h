//
//  NSObject+RFDestoryNotify.h
//  RF
//
//  Created by gouzhehua on 15-2-12.
//  Copyright (c) 2015年 RF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RFDestoryNotify;

typedef void(^RFDestoryNotifyBlock)(RFDestoryNotify *notify);

@interface RFDestoryNotify : NSObject
{

}
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, strong) RFDestoryNotifyBlock block;

@end

@interface NSObject (RFDestoryNotify)
- (NSMutableDictionary *)rfDestoryNotifyDictionary;
- (void)rfDestoryNotifySetName:(NSString *)name block:(RFDestoryNotifyBlock)block;
- (void)rfDestoryNotifySetName:(NSString *)name userInfo:(NSDictionary *)userInfo block:(RFDestoryNotifyBlock)block;
- (void)rfDestoryNotifyRemoveWithName:(NSString *)name;
@end