//
//  TestMRCProperties.h
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"

@interface TestMRCProperties : NSObject

@property (atomic,assign) TestObject *tassign;
@property (nonatomic,retain) TestObject *tretain;
@property (nonatomic,copy) TestObject *tcopy;

- (instancetype)init;
@end
