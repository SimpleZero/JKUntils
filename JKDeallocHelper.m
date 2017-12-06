//
//  JKDeallocHelper.m
//  JKDeallocHelper
//
//  Created by 01 on 2017/12/6.
//  Copyright © 2017年 01. All rights reserved.
//

#import "JKDeallocHelper.h"
#import <objc/runtime.h>

@implementation JKDeallocHelper {
    dispatch_block_t _block;
}

- (id)initWithBlock:(dispatch_block_t)block {
    if (self = [super init]) {
        _block = [block copy];
    }
    return self;
}

- (void)dealloc {
    !_block ? : _block();
}

@end


@implementation NSObject (JKDeallocHelper)

const void *JKDeallocHelperKey = &JKDeallocHelperKey;

- (void)jk_executeDeallocHelperBlock:(dispatch_block_t)block {
    if (block) {
        JKDeallocHelper *helper = [[JKDeallocHelper alloc] initWithBlock:block];
        
        @synchronized(self) {
            NSHashTable *table = objc_getAssociatedObject(self, JKDeallocHelperKey);
            if (!table) {
                table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
                objc_setAssociatedObject(self, JKDeallocHelperKey, table, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            [table addObject:helper];
        }
        
    }
}

@end
