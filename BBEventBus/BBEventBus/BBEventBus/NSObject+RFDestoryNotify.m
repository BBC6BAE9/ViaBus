//
//  NSObject+RFDestoryNotify.m
//  RF
//
//  Created by gouzhehua on 15-2-12.
//  Copyright (c) 2015年 RF. All rights reserved.
//

#import "NSObject+RFDestoryNotify.h"
#import <objc/runtime.h>

@interface RFDestoryNotify ()
@end

@implementation RFDestoryNotify
@synthesize name = _name;
@synthesize userInfo = _userInfo;
@synthesize block = _block;

- (void)dealloc
{
	RFDestoryNotifyBlock block = [self block];
	if (block != nil)
	{
		block(self);
	}
	
	_block = nil;
	_userInfo = nil;
	_name = nil;
}

@end

@implementation NSObject (RFDestoryNotify)

- (NSMutableDictionary *)rfDestoryNotifyDictionary
{
	static void * kStorageKey = "kDestoryNotifyDictionary";
	NSMutableDictionary *dict = (NSMutableDictionary *)objc_getAssociatedObject(self, kStorageKey);
	if (dict == nil)
	{
		dict = [NSMutableDictionary dictionary];
		objc_setAssociatedObject(self, kStorageKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return dict;
}

- (void)rfDestoryNotifySetName:(NSString *)name block:(RFDestoryNotifyBlock)block
{
	[self rfDestoryNotifySetName:name userInfo:nil block:block];
}

- (void)rfDestoryNotifySetName:(NSString *)name userInfo:(NSDictionary *)userInfo block:(RFDestoryNotifyBlock)block
{
	[self rfDestoryNotifyRemoveWithName:name];
	
	RFDestoryNotify *dn = [[RFDestoryNotify alloc] init];
	dn.name = name;
	dn.block = block;
	dn.userInfo = userInfo;
	[[self rfDestoryNotifyDictionary] setObject:dn forKey:name];
}

- (void)rfDestoryNotifyRemoveWithName:(NSString *)name
{
	NSMutableDictionary *dict = [self rfDestoryNotifyDictionary];
	RFDestoryNotify *dn = [dict objectForKey:name];
	if (dn != nil)
	{
		dn.block = nil;
		dn.userInfo = nil;
		[dict removeObjectForKey:name];
		dn = nil;
	}
}

@end
