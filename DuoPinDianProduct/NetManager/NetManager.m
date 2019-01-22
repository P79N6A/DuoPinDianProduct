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
    [[NetManager shareManager] post:DPDfreeGoods paramters:page == nil?nil:param success:^(BOOL isSuccess, id responseObject) {
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
                            @"token":VALIDATE_STRING(token)
                            } mutableCopy];
    
    begin == nil?:[param setValue:VALIDATE_STRING(begin) forKey:@"begin"];
    end == nil?:[param setValue:VALIDATE_STRING(end) forKey:@"end"];
    page == nil?:[param setValue:VALIDATE_STRING(page) forKey:@"page"];
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
                            @"id":VALIDATE_STRING(typeId)
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
    
    [[NetManager shareManager] post:path paramters:sign == nil?nil:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


////拼多多商品搜索/类目查看
//#define DPDpddsearch @"/miniapp/pdd/search"
+(void)DPDpddsearchSortType:(NSString *)sortType withCoupon:(NSString *)withCoupon optId:(NSString *)optId keyword:(NSString *)keyword page:(NSString *)page token:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure{
    
    NSMutableDictionary *param = [@{
                            @"token":VALIDATE_STRING(token)
                            } mutableCopy];
    sortType == nil?:[param setValue:VALIDATE_STRING(sortType) forKey:@"sortType"];
    withCoupon == nil?:[param setValue:VALIDATE_STRING(withCoupon) forKey:@"withCoupon"];
    optId == nil?:[param setValue:VALIDATE_STRING(optId) forKey:@"optId"];
    keyword == nil?:[param setValue:VALIDATE_STRING(keyword) forKey:@"keyword"];
    page == nil?:[param setValue:VALIDATE_STRING(page) forKey:@"page"];
    [[NetManager shareManager] post:DPDpddsearch paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////获取短信验证码
//#define DPDgetCode @"/miniapp/getCode"
+(void)DPDgetCodeMobile:(NSString *)mobile token:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"mobile":VALIDATE_STRING(mobile),
                            @"token":VALIDATE_STRING(token)
                            };
    [[NetManager shareManager] post:DPDgetCode paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


////拼多多分类
//#define DPDpddtypes @"/miniapp/pdd/types"
+(void)DPDpddtypesId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure{
    
    NSDictionary *param = @{
                            @"id":VALIDATE_STRING(typeId)
                            };
    [[NetManager shareManager] post:DPDpddtypes paramters:typeId == nil?nil:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////拼多多商品分享图片
//#define DPDpddgoodsImg @"/miniapp/pdd/goodsImg/"
+(void)DPDpddgoodsImgToken:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token)
                            };
    [[NetManager shareManager] post:DPDpddgoodsImg paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////登录
//#define DPDlogin @"/miniapp/login"
+(void)DPDloginCode:(NSString *)code encryptedData:(NSString *)encryptedData iv:(NSString *)iv inviterCode:(NSString *)inviterCode success:(void(^) (BOOL isSuccess, id responseObject))success
                    failure:(void(^) (NSError *error))failure{
    NSMutableDictionary *param = [@{
                                    @"code":VALIDATE_STRING(code),
                                    @"encryptedData":VALIDATE_STRING(encryptedData),
                                    @"iv":VALIDATE_STRING(iv)
                                    } mutableCopy];
    inviterCode == nil?:[param setValue:VALIDATE_STRING(inviterCode) forKey:@"inviterCode"];
    [[NetManager shareManager] post:DPDlogin paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////热词
//#define DPDhotWord @"/miniapp/hotWord"
+(void)DPDhotWordSuccess:(void(^) (BOOL isSuccess, id responseObject))success
                          failure:(void(^) (NSError *error))failure{
    [[NetManager shareManager] post:DPDhotWord paramters:nil success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////淘宝关键字搜索/类目查看
//#define DPDtbsearch @"/miniapp/tb/search"
+(void)DPDtbsearchEndPrice:(NSString *)endPrice startPrice:(NSString *)startPrice sort:(NSString *)sort hasCoupon:(NSString *)hasCoupon needFreeShipment:(NSString *)needFreeShipment cat:(NSString *)cat q:(NSString *)q  pageNo:(NSString *)pageNo success:(void(^) (BOOL isSuccess, id responseObject))success
                    failure:(void(^) (NSError *error))failure{
    
    NSMutableDictionary *param = [@{} mutableCopy];
    endPrice == nil?:[param setValue:VALIDATE_STRING(endPrice) forKey:@"endPrice"];
    startPrice == nil?:[param setValue:VALIDATE_STRING(startPrice) forKey:@"startPrice"];
    sort == nil?:[param setValue:VALIDATE_STRING(sort) forKey:@"sort"];
    hasCoupon == nil?:[param setValue:VALIDATE_STRING(hasCoupon) forKey:@"hasCoupon"];
    needFreeShipment == nil?:[param setValue:VALIDATE_STRING(needFreeShipment) forKey:@"needFreeShipment"];
    cat == nil?:[param setValue:VALIDATE_STRING(cat) forKey:@"cat"];
    hasCoupon == nil?:[param setValue:VALIDATE_STRING(hasCoupon) forKey:@"hasCoupon"];
    pageNo == nil?:[param setValue:VALIDATE_STRING(pageNo) forKey:@"pageNo"];
    [[NetManager shareManager] post:DPDtbsearch paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////生成淘口令
//#define DPDtbtpwd @"/miniapp/tb/tpwd"
+(void)DPDtbtpwdText:(NSString *)text url:(NSString *)url logo:(NSString *)logo success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure{
    NSMutableDictionary *param = [@{
                                    @"text":VALIDATE_STRING(text),
                                    @"url":VALIDATE_STRING(url),
                                    @"logo":VALIDATE_STRING(logo)
                                    } mutableCopy];
    [[NetManager shareManager] post:DPDtbtpwd paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////我的订单
//#define DPDorderlist @"/miniapp/order/list"
/*
 订单状态：1.已付款 2.已结算 3.已失效；不传返回全部 4.确认收货
 订单来源：1.淘宝 2.京东 3.拼多多；不传返回全部
 */
+(void)DPDorderlistToken:(NSString *)token orderStatus:(NSString *)orderStatus orderSource:(NSString *)orderSource page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure{
    NSMutableDictionary *param = [@{
                                    @"token":VALIDATE_STRING(token)
                                    } mutableCopy];
    orderStatus == nil?:[param setValue:VALIDATE_STRING(orderStatus) forKey:@"orderStatus"];
    orderSource == nil?:[param setValue:VALIDATE_STRING(orderSource) forKey:@"orderSource"];
    page == nil?:[param setValue:VALIDATE_STRING(page) forKey:@"page"];
    [[NetManager shareManager] post:DPDorderlist paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////我的粉丝
//#define DPDuserfans @"/miniapp/user/fans"
+(void)DPDuserfansNikeName:(NSString *)nikeName token:(NSString *)token page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure{
    NSMutableDictionary *param = [@{} mutableCopy];
    nikeName == nil?:[param setValue:VALIDATE_STRING(nikeName) forKey:@"nikeName"];
    token == nil?:[param setValue:VALIDATE_STRING(token) forKey:@"token"];
    page == nil?:[param setValue:VALIDATE_STRING(page) forKey:@"page"];
    [[NetManager shareManager] post:DPDuserfans paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////拼多多广告位
//#define DPDpddbanner @"/miniapp/pdd/banner"
+(void)DPDpddbannerTypeId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"typeId":VALIDATE_STRING(typeId)
                            };
    [[NetManager shareManager] post:DPDpddbanner paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////收入明细
//#define DPDuserbill @"/miniapp/user/bill"
+(void)DPDuserbillToken:(NSString *)token begin:(NSString *)begin success:(void(^) (BOOL isSuccess, id responseObject))success
                  failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token),
                            @"begin":VALIDATE_STRING(begin)
                            };
    [[NetManager shareManager] post:DPDuserbill paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////团队订单数
//#define DPDteamorderlist @"/miniapp/team/order/list"
+(void)DPDteamorderlistToken:(NSString *)token orderStatus:(NSString *)orderStatus orderSource:(NSString *)orderSource page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure{
    NSMutableDictionary *param = [@{
                                    @"token":VALIDATE_STRING(token)
                                    } mutableCopy];
    orderStatus == nil?:[param setValue:VALIDATE_STRING(orderStatus) forKey:@"orderStatus"];
    orderSource == nil?:[param setValue:VALIDATE_STRING(orderSource) forKey:@"orderSource"];
    page == nil?:[param setValue:VALIDATE_STRING(page) forKey:@"page"];
    [[NetManager shareManager] post:DPDteamorderlist paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////用户报表
//#define DPDuserreport @"/miniapp/user/report"
+(void)DPDuserreportToken:(NSString *)token type:(NSString *)type success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token),
                            @"type":VALIDATE_STRING(type)
                            };
    [[NetManager shareManager] post:DPDuserreport paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////提现
//#define DPDuserwithdraw @"/user/withdraw"
+(void)DPDuserwithdrawMobile:(NSString *)mobile token:(NSString *)token code:(NSString *)code money:(NSString *)money realname:(NSString *)realname alipay:(NSString *)alipay success:(void(^) (BOOL isSuccess, id responseObject))success
                  failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"mobile":VALIDATE_STRING(mobile),
                            @"token":VALIDATE_STRING(token),
                            @"code":VALIDATE_STRING(code),
                            @"money":VALIDATE_STRING(money),
                            @"realname":VALIDATE_STRING(realname),
                            @"alipay":VALIDATE_STRING(alipay)
                            };
    [[NetManager shareManager] post:DPDuserwithdraw paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////提现信息
//#define DPDuserwithdrawinfo @"/miniapp/user/withdraw/info"
+(void)DPDuserwithdrawinfoToken:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                  failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token)
                            };
    [[NetManager shareManager] post:DPDuserwithdrawinfo paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////解绑手机号
//#define DPDuntyingMobile @"/miniapp/untyingMobile"
+(void)DPDuntyingMobileMobile:(NSString *)mobile token:(NSString *)token code:(NSString *)code success:(void(^) (BOOL isSuccess, id responseObject))success
                     failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"mobile":VALIDATE_STRING(mobile),
                            @"token":VALIDATE_STRING(token),
                            @"code":VALIDATE_STRING(code)
                            };
    [[NetManager shareManager] post:DPDuntyingMobile paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
////个人中心
//#define DPDuserhome @"/miniapp/user/home"
+(void)DPDuserhomeToken:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                        failure:(void(^) (NSError *error))failure{
    NSDictionary *param = @{
                            @"token":VALIDATE_STRING(token)
                            };
    [[NetManager shareManager] post:DPDuserhome paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

////绑定手机号
//#define DPDminiappphone @"/miniapp/phone"
+(void)DPDminiappphoneEncryptedData:(NSString *)encryptedData iv:(NSString *)iv token:(NSString *)token mobile:(NSString *)mobile  code:(NSString *)code success:(void(^) (BOOL isSuccess, id responseObject))success
                   failure:(void(^) (NSError *error))failure{
    NSMutableDictionary *param = [@{} mutableCopy];
    encryptedData == nil?:[param setValue:VALIDATE_STRING(encryptedData) forKey:@"encryptedData"];
    iv == nil?:[param setValue:VALIDATE_STRING(iv) forKey:@"iv"];
    token == nil?:[param setValue:VALIDATE_STRING(token) forKey:@"token"];
    mobile == nil?:[param setValue:VALIDATE_STRING(mobile) forKey:@"mobile"];
    code == nil?:[param setValue:VALIDATE_STRING(code) forKey:@"code"];
    [[NetManager shareManager] post:DPDminiappphone paramters:param success:^(BOOL isSuccess, id responseObject) {
        success(isSuccess,responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
