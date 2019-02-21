//
//  SKPaymentTransaction+orderInfo.h
//  fishingMerge_ios_hybrid
//
//  Created by laijinyan on 2019/2/21.
//  Copyright © 2019年 egret. All rights reserved.
//

#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SKPaymentTransaction (orderInfo)
- (NSString*)orderInfo;
- (void)storageOrderInfoWhenPurched;
@end

NS_ASSUME_NONNULL_END
