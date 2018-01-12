//
//  TestARCProperties.m
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "TestARCProperties.h"

@implementation TestARCProperties

- (instancetype)init {
	self = [super init];
	if (self) {
		self.tweak = [[TestObject alloc] initWithName:@"tweak"];
		self.tstrong = [[TestObject alloc] initWithName:@"tstrong"];
		self.tcopy = _tstrong;
		self.tassign = [[TestObject alloc] initWithName:@"tassign"];
		NSLog(@"props: w-%@ s-%@ c-%@ a-%@", self.tweak, self.tstrong, self.tcopy, @"crash");
	}
	return self;
}

@end
