//
//  MAutoreleasePool.m
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "MAutoreleasePool.h"

static MAutoreleasePool *mAutoreleasePool = nil;

@implementation MAutoreleasePool {
	NSMutableArray *objects;
}

+ (instancetype)getPool {
	@synchronized(self) {
		if(mAutoreleasePool == nil)
			mAutoreleasePool = [[super allocWithZone:NULL] init];
	}
	return mAutoreleasePool;
}
+ (id)allocWithZone:(NSZone *)zone {
	return [[self getPool] retain];
}
- (id)copyWithZone:(NSZone *)zone {
	return self;
}
- (id)retain {
	return self;
}
- (unsigned long)retainCount {
	return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
	// never release
}
- (id)autorelease {
	return self;
}
- (id)init {
	if (self = [super init]) {
		objects = [NSMutableArray new];
	}
	return self;
}
- (void)dealloc {
	// Should never be called, but just here for clarity really.
	[objects release];
	[super dealloc];
}

- (instancetype)add:(id)aObject {
	if (![objects containsObject:aObject]) {
		[objects addObject:aObject];
	}
	return aObject;
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
