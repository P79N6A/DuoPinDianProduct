//
//  NetManager.m
//  DuoPinDianProduct
//
//  Created by 张元一 on 2019/1/22.
//  Copyright © 2019 张元一. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
//会员等级
//#define DPDcustomerRankList @"/miniapp/customerRankList"
+(void)DPDcustomerRankListSuccess:(void(^) (BOOL isSuccess, id responseObject))success
                          failure:(void(^) (NSError *error))failure{
    [[NetManager shareManager] post:DPDcustomerRankList paramters:nil success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
//会员等级购买
//#define DPDpayCustomerRank @"/miniapp/payCustomerRank"
+(void)DPDPayCustomerRankCode:(NSString *)code RankId:(NSString *)rankid success:(void(^) (BOOL isSuccess, id responseObject))success
                          failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"code":VALIDATE_STRING(code),
                            @"rankId":VALIDATE_STRING(rankid)
                            };
    [[NetManager shareManager] post:DPDpayCustomerRank paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
//拼多多商品详情图片url列表
//#define DPDpddcommodityDetailsImg @"/miniapp/pdd/commodityDetailsImg"
+(void)DPDpddcommodityDetailsImgToken:(NSString *)token Id:(NSString *)objid success:(void(^) (BOOL isSuccess, id responseObject))success
                      failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token),
                            @"id":VALIDATE_STRING(objid)
                            };
    [[NetManager shareManager] post:DPDpddcommodityDetailsImg paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

//淘宝商品详情图片url列表
//#define DPDtaobaocommodityDetailsImg @"/miniapp/taobao/commodityDetailsImg"
+(void)DPDtaobaocommodityDetailsImgToken:(NSString *)token Id:(NSString *)objid success:(void(^) (BOOL isSuccess, id responseObject))success
                              failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token),
                            @"id":VALIDATE_STRING(objid)
                            };
    [[NetManager shareManager] post:DPDtaobaocommodityDetailsImg paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
//淘宝商品详情（简版）
//#define DPDtbgoods @"/miniapp/tb/goods/"
+(void)DPDtbgoodsId:(NSString *)objid success:(void(^) (BOOL isSuccess, id responseObject))success
                                 failure:(void(^) (NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@%@",DPDtbgoods,VALIDATE_STRING(objid)];
    [[NetManager shareManager] post:path paramters:nil success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
////抢购商品
//#define DPDgetFreeGoods @"/miniapp/getFreeGoods"
+(void)DPDgetFreeGoodsFreeGoodsId:(NSString *)freeGoodsId Token:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                                 failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"freeGoodsId":VALIDATE_STRING(freeGoodsId),
                            @"token":VALIDATE_STRING(token)
                            };
    [[NetManager shareManager] post:DPDgetFreeGoods paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////获取抢购商品
//#define DPDfreeGoods @"/miniapp/freeGoods"
+(void)DPDfreeGoodsPage:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                          failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"page":VALIDATE_STRING(page)
                            };
    [[NetManager shareManager] post:DPDfreeGoods paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
////用户账单明细
//#define DPDbilllist @"/miniapp/bill/list"
//开始时间（不能超过当前时间的前180天）,参数不传默认最新账单记录倒序
+(void)DPDbilllistToken:(NSString *)token Begin:(NSString *)begin End:(NSString *)end Page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure{
   
    NSMutableDictionary *param = [@{
                            @"token":VALIDATE_STRING(token),
                            @"end":VALIDATE_STRING(end),
                            @"page":VALIDATE_STRING(page)
                            } mutableCopy];
    if(begin != nil){
        [param setObject:VALIDATE_STRING(begin) forKey:param];
    }
    [[NetManager shareManager] post:DPDbilllist paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
////淘宝广告位
//#define DPDtbbanner @"/miniapp/tb/banner"
+(void)DPDtbbannerTypeId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"typeId":VALIDATE_STRING(typeId)
                            };
    [[NetManager shareManager] post:DPDtbbanner paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
////淘宝分类
//#define DPDtbtypes @"/miniapp/tb/types"
//需要二级分类时传参id,不需要传nil
+(void)DPDtbtypesId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure{
    
    NSDictionary *param = @{
                            @"typeId":VALIDATE_STRING(typeId)
                            };
    [[NetManager shareManager] post:DPDtbtypes paramters:typeId == nil?nil:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////拼多多商品详情
//#define DPDpddgoods @"/miniapp/pdd/goods/"
//sign 用户邀请码
+(void)DPDpddgoodsId:(NSString *)objid Sign:(NSString *)sign success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure{
    NSString *path = [NSString stringWithFormat:@"%@%@",DPDpddgoods,VALIDATE_STRING(objid)];
    NSDictionary *param = @{
                            @"sign":VALIDATE_STRING(sign)
                            };
    [[NetManager shareManager] post:path paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


////拼多多商品搜索/类目查看
//#define DPDpddsearch @"/miniapp/pdd/search"
////获取短信验证码
//#define DPDgetCode @"/miniapp/getCode"
////拼多多分类
//#define DPDpddtypes @"/miniapp/pdd/types"
////拼多多商品分享图片
//#define DPDpddgoodsImg @"/miniapp/pdd/goodsImg/"
////登录
//#define DPDlogin @"/miniapp/login"
////热词
//#define DPDhotWord @"/miniapp/hotWord"
////淘宝关键字搜索/类目查看
//#define DPDtbsearch @"/miniapp/tb/search"
////生成淘口令
//#define DPDtbtpwd @"/miniapp/tb/tpwd"
////我的订单
//#define DPDorderlist @"/miniapp/order/list"
////我的粉丝
//#define DPDuserfans @"/miniapp/user/fans"
////拼多多广告位
//#define DPDpddbanner @"/miniapp/pdd/banner"
////收入明细
//#define DPDuserbill @"/miniapp/user/bill"
////团队订单数
//#define DPDteamorderlist @"/miniapp/team/order/list"
////用户报表
//#define DPDuserreport @"/miniapp/user/report"
////提现
//#define DPDuserwithdraw @"/user/withdraw"
////提现信息
//#define DPDuserwithdrawinfo @"/miniapp/user/withdraw/info"
////解绑手机号
//#define DPDuntyingMobile @"/miniapp/untyingMobile"
////个人中心
//#define DPDuserhome @"/miniapp/user/home"
////绑定手机号
//#define DPDminiappphone @"/miniapp/phone"
@end
