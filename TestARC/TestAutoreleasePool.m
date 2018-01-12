//
//  TestAutoreleasePool.m
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "TestAutoreleasePool.h"
#import "MAutoreleasePool.h"

@implementation TestAutoreleasePool

- (instancetype)init {
	self = [super init];
	if (self) {
		MAutoreleasePool *pool = [MAutoreleasePool new];
		
		for (int i = 0; i < 10; i++) {
			NSString *forString = [[NSString alloc] initWithFormat:@"TestPool%d", i];
			[pool add:forString];
			[pool printStatus];
			[pool drain];
		}
		[pool release];
	}
	return self;
}

@end
