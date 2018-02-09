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
#import "NSObject+MAutorelease.h"

@implementation TestAutoreleasePool

- (void)testInitWithString {
	for (int i = 0; i < 4; i++) {
		NSString *n1 = [[[NSString alloc] initWithString:@"TestPool1_%d"] addToAutorelease];
		NSString *n2 = [[[NSString alloc] initWithString:@"TestPool2_%d"] addToAutorelease];

		TestObject *to1 = [[[TestObject alloc] initWithName:n1] addToAutorelease];
		TestObject *to2 = [[[TestObject alloc] initWithName:n2] addToAutorelease];

		[to1 emptyMethod];
		[to2 emptyMethod];
	}
}

- (void)testInitWithFormat {
	for (int i = 0; i < 4; i++) {
		NSString *n1 = [[[NSString alloc] initWithFormat:@"TestPool1_%d", i] addToAutorelease];
		NSString *n2 = [[[NSString alloc] initWithFormat:@"TestPool2_%d", i] addToAutorelease];
		TestObject *to1 = [[[TestObject alloc] initWithName:n1] addToAutorelease];
		TestObject *to2 = [[[TestObject alloc] initWithName:n2] addToAutorelease];

		[to1 emptyMethod];
		[to2 emptyMethod];
	}
}

@end
