//
//  MAutoreleasePool.m
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "MAutoreleasePool.h"

enum AddedObjectsStatus {
	NO_OBJECTS, EXISTS_OBJECTS, NEED_FOR_DELETE
};

const float drainInterval = 1.0;
static MAutoreleasePool *mAutoreleasePool = nil;

@implementation MAutoreleasePool {
	NSMutableArray *objects;
	enum AddedObjectsStatus addedObjectsStatus;
}

+ (instancetype)getPool {
	@synchronized(self) {
		if(mAutoreleasePool == nil) {
			mAutoreleasePool = [[super allocWithZone:NULL] init];
		}
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
		addedObjectsStatus = NO_OBJECTS;
		[NSTimer scheduledTimerWithTimeInterval:drainInterval target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
	}
	return self;
}
- (void)dealloc {
	// Should never be called, but just here for clarity really.
	[objects release];
	[super dealloc];
}

- (instancetype)add:(id)aObject {
	@synchronized(self) {
		if (![objects containsObject:aObject]) {
			[objects addObject:aObject];
		}
		addedObjectsStatus = EXISTS_OBJECTS;
	}
	return aObject;
}

- (void)drain {
	@synchronized(self) {
		[self printStatus];
		for (id object in objects) {
			[object release];
		}
		[objects removeAllObjects];
		addedObjectsStatus = NO_OBJECTS;
	}
}

- (void)printStatus {
	NSLog(@"P: %@", [[objects valueForKey:@"description"] componentsJoinedByString:@" "]);
}

-(void)onTimer {
	@synchronized(self) {
		switch (addedObjectsStatus) {
			case EXISTS_OBJECTS:
				addedObjectsStatus = NEED_FOR_DELETE;
				break;
			case NEED_FOR_DELETE:
				[self drain];
				break;
			default:
				break;
		}
	}
}

@end
