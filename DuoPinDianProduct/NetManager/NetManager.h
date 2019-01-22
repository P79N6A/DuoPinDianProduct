//
//  NetManager.h
//  DuoPinDianProduct
//
//  Created by 张元一 on 2019/1/22.
//  Copyright © 2019 张元一. All rights reserved.
//

#import "HTTPRequestManager.h"
#import "HTTPRequestUrl.h"
NS_ASSUME_NONNULL_BEGIN

@interface NetManager : HTTPRequestManager
//会员等级
#define DPDcustomerRankList @"/miniapp/customerRankList"
+(void)DPDcustomerRankListSuccess:(void(^) (BOOL isSuccess, id responseObject))success
                          failure:(void(^) (NSError *error))failure;


@end

NS_ASSUME_NONNULL_END
