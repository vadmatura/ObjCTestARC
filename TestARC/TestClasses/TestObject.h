//
//  TestObject.h
//  TestARC
//
//  Created by Vadym Matura on 1/5/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
@property (readonly, strong) NSString* name;

- (instancetype)initWithName:(NSString *) name;
- (id)copyWithZone:(NSZone *) zone;
- (void)testMethod;
- (void)emptyMethod;
@end
