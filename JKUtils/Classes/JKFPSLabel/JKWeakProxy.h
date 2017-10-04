//
//  JKWeakProxy.h
//  JKAsyncLayer
//
//  Created by 01 on 2017/9/25.
//  Copyright © 2017年 01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKWeakProxy : NSProxy

@property (nonatomic, weak, readonly) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
