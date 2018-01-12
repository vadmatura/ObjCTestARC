//
//  MAutoreleasePool.m
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "MAutoreleasePool.h"

@implementation MAutoreleasePool {
	NSMutableArray *objects;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		objects = [NSMutableArray new];
	}
	return self;
}

-(void)dealloc {
	[objects release];
	[super dealloc];
}

- (void)add:(id)aObject {
	if (![objects containsObject:aObject]) {
		[objects addObject:aObject];
	}
}

- (void)drain {
	[self printStatus];
	for (id object in objects) {
		[object release];
	}
	[objects removeAllObjects];
}

- (void)printStatus {
	NSLog(@"P: %@", [[objects valueForKey:@"description"] componentsJoinedByString:@" "]);
}
@end
