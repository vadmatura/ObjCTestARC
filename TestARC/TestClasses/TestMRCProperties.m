//
//  TestMRCProperties.m
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "TestMRCProperties.h"

@implementation TestMRCProperties {
	TestObject *_tassign;
	TestObject *_tretain;
	TestObject *_tcopy;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		self.tassign = [[TestObject alloc] initWithName:@"tassign"];
		self.tretain = [[TestObject alloc] initWithName:@"tretain"];
		self.tcopy = self.tassign;
		NSLog(@"Mprops: a-%@ r-%@ c-%@", self.tassign, self.tretain, self.tcopy);
		[self.tassign release];
		[self.tretain release];
		[self.tcopy release];
		NSLog(@"Mprops: a-%@ r-%@ c-%@", @"crash", self.tretain, @"crash");
		[self.tretain release];
	}
	return self;
}

- (TestObject *)tassign {
	TestObject *tmpObj;
	@synchronized(self) {
		tmpObj = _tassign;
	}
	return tmpObj;
}

- (void)setTassign:(TestObject *)tassign {
	@synchronized(self) {
		_tassign = tassign;
	}
}

- (TestObject *)tretain {
	return _tretain;
}

- (void)setTretain:(TestObject *)newObj {
	[newObj retain];
	[_tretain release];
	_tretain = newObj;
}

- (TestObject *)tcopy {
	return _tcopy;
}

- (void)setTcopy:(TestObject *)tcopy {
	TestObject *oldTcopy = _tcopy;
	_tcopy = [tcopy copy];
	[oldTcopy release];
}

@end
