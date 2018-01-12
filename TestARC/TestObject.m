//
//  TestObject.m
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "TestObject.h"

static int testObjectCount = 0;

@implementation TestObject

- (instancetype)init {
	@throw [NSException exceptionWithName:NSInternalInconsistencyException
		reason:@"-init is not a valid initializer for the class Foo"
		userInfo:nil];
	return nil;
}

- (instancetype)initWithName:(NSString *) name {
	self = [super init];
	if (self) {
		_name = name;
		testObjectCount++;
		NSLog(@"+ %@ %d", self.name, testObjectCount);
	}
	return self;
}

- (id)copyWithZone:(NSZone *) zone {
	NSMutableString *newName = [[NSMutableString alloc] initWithString:self.name];
	[newName appendString:@"-C"];
	TestObject *object = [[[self class] allocWithZone:zone] initWithName:newName];
	return object;
}

- (void)dealloc {
	testObjectCount--;
	NSLog(@"- %@ %d", self.name, testObjectCount);
}

- (void)testMethod {
	NSLog(@"testMethod: %@ %d", self.name, testObjectCount);
}

- (void)emptyMethod {
	//do nothing
}

-(NSString *)description {
	return _name;
}

@end
