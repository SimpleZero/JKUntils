//
//  JKDeallocHelper.h
//  JKDeallocHelper
//
//  Created by 01 on 2017/12/6.
//  Copyright © 2017年 01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKDeallocHelper : NSObject

- initWithBlock:(dispatch_block_t)block;

@end


@interface NSObject (JKDeallocHelper)

- (void)jk_executeDeallocHelperBlock:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END

