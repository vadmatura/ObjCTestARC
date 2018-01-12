//
//  ViewController.m
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import "ViewController.h"
#import "TestARCProperties.h"
#import "TestMRCProperties.h"
#import "TestAutoreleasePool.h"

TestARCProperties *tpA;
TestMRCProperties *tpM;

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	tpA = [TestARCProperties new];
	tpM = [TestMRCProperties new];
	TestObject *to = [[TestObject alloc] initWithName:@"to"];
	[to testMethod];
	TestAutoreleasePool *tap = [TestAutoreleasePool new];
	tpM = nil;
	tpA = nil;
	// Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}


@end
