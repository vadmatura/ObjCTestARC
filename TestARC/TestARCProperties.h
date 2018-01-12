//
//  TestARCProperties.h
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"

@interface TestARCProperties : NSObject

@property (nonatomic,weak) TestObject *tweak;
@property (nonatomic,strong) TestObject *tstrong;
@property (nonatomic,copy) TestObject *tcopy;
@property (nonatomic,assign) TestObject *tassign;

- (instancetype)init;

@end
