//
//  TestMethodSwizzling.m
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "TestObject.h"

@implementation TestObject (MS)

+ (void)load {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Class class = [self class];
		
		SEL originalSelector = @selector(testMethod);
		SEL swizzledSelector = @selector(newTestMethod);
		
		Method originalMethod = class_getInstanceMethod(class, originalSelector);
		Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
		
		// When swizzling a class method, use the following:
		// Class class = object_getClass((id)self);
		// ...
		// Method originalMethod = class_getClassMethod(class, originalSelector);
		// Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
		
		BOOL didAddMethod = class_addMethod(class,
										originalSelector,
										method_getImplementation(swizzledMethod),
										method_getTypeEncoding(swizzledMethod));
		
		if (didAddMethod) {
			class_replaceMethod(class,
													swizzledSelector,
													method_getImplementation(originalMethod),
													method_getTypeEncoding(originalMethod));
		} else {
			method_exchangeImplementations(originalMethod, swizzledMethod);
		}
	});
}

- (void)newTestMethod {
	[self newTestMethod];
	NSLog(@"swizzled!!!");
}

@end
