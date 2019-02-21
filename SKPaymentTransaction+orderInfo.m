//
//  SKPaymentTransaction+orderInfo.m
//  fishingMerge_ios_hybrid
//
//  Created by laijinyan on 2019/2/21.
//  Copyright © 2019年 egret. All rights reserved.
//

#import "SKPaymentTransaction+orderInfo.h"
#import "SFHFKeychainUtils.h"

@implementation SKPaymentTransaction (orderInfo)

- (NSString *)orderInfo {
    NSString *oid = self.payment.applicationUsername;
    if (self.transactionState == SKPaymentTransactionStatePurchased) {
        NSString *applicationUsername = [SFHFKeychainUtils getPasswordForUsername:self.transactionIdentifier andServiceName:@"orderId" error:nil];
        NSLog(@"从keychain获取orderId: %@--%@", self.transactionIdentifier, applicationUsername);
        if (oid == nil || [oid isEqualToString:@""]) {
            oid = applicationUsername;
        }
    }
    return oid;
}
- (void)storageOrderInfoWhenPurched {
    NSString *oid = self.payment.applicationUsername;
    if (self.transactionState == SKPaymentTransactionStatePurchased && oid != nil && [oid length] > 0) {
        NSLog(@"存储 订单id到keychain: %@--%@", self.transactionIdentifier, self.payment.applicationUsername);
        [SFHFKeychainUtils storeUsername:self.transactionIdentifier andPassword:oid forServiceName:@"orderId" updateExisting:YES error:nil];
    }
}
@end
