//
//  MAutoreleasePool.h
//  TestARC
//
//  Created by Vadym Matura on 1/9/18.
//  Copyright © 2018 Vadym Matura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAutoreleasePool : NSObject
+ (instancetype)getPool;
- (instancetype)add:(id)aObject;
@end
