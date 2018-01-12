//
//  TestAutoreleasePool.m
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "TestAutoreleasePool.h"
#import "MAutoreleasePool.h"
#import "TestObject.h"

@implementation TestAutoreleasePool

- (instancetype)init {
	self = [super init];
	if (self) {
		MAutoreleasePool *pool = [MAutoreleasePool new];
		
		for (int i = 0; i < 10; i++) {
			TestObject *to1 = [[TestObject alloc] initWithName:[[NSString alloc] initWithFormat:@"TestPool1_%d", i]];
			TestObject *to2 = [[TestObject alloc] initWithName:[[NSString alloc] initWithFormat:@"TestPool2_%d", i]];
			[pool add:to1];
			[pool add:to2];
			
			[to1 emptyMethod];
			[to2 emptyMethod];
			
			[pool drain];
		}
		[pool release];
	}
	return self;
}

@end
