//
//  NSObject+MAutorelease.m
//  TestARC
//
//  Created by Vadym Matura on 1/18/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "NSObject+MAutorelease.h"
#import "MAutoreleasePool.h"

@implementation NSObject (MAutorelease)

- (instancetype)addToAutorelease {
	return [MAutoreleasePool.getPool add:self];
}

@end
