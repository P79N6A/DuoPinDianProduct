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
//会员等级购买
//#define DPDpayCustomerRank @"/miniapp/payCustomerRank"
+(void)DPDPayCustomerRankCode:(NSString *)code RankId:(NSString *)rankid success:(void(^) (BOOL isSuccess, id responseObject))success
                      failure:(void(^) (NSError *error))failure;
//拼多多商品详情图片url列表
//#define DPDpddcommodityDetailsImg @"/miniapp/pdd/commodityDetailsImg"
+(void)DPDpddcommodityDetailsImgToken:(NSString *)token Id:(NSString *)objid success:(void(^) (BOOL isSuccess, id responseObject))success
                              failure:(void(^) (NSError *error))failure;

//淘宝商品详情图片url列表
//#define DPDtaobaocommodityDetailsImg @"/miniapp/taobao/commodityDetailsImg"
+(void)DPDtaobaocommodityDetailsImgToken:(NSString *)token Id:(NSString *)objid success:(void(^) (BOOL isSuccess, id responseObject))success
                                 failure:(void(^) (NSError *error))failure;
//淘宝商品详情（简版）
//#define DPDtbgoods @"/miniapp/tb/goods/"
+(void)DPDtbgoodsId:(NSString *)objid success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure;

////抢购商品
//#define DPDgetFreeGoods @"/miniapp/getFreeGoods"
+(void)DPDgetFreeGoodsFreeGoodsId:(NSString *)freeGoodsId Token:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                          failure:(void(^) (NSError *error))failure;

////获取抢购商品
//#define DPDfreeGoods @"/miniapp/freeGoods"
+(void)DPDfreeGoodsPage:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure;
////用户账单明细
//#define DPDbilllist @"/miniapp/bill/list"
//开始时间（不能超过当前时间的前180天）,参数不传默认最新账单记录倒序
+(void)DPDbilllistToken:(NSString *)token Begin:(NSString *)begin End:(NSString *)end Page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure;

////淘宝广告位
//#define DPDtbbanner @"/miniapp/tb/banner"
+(void)DPDtbbannerTypeId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure;

////淘宝分类
//#define DPDtbtypes @"/miniapp/tb/types"
//需要二级分类时传参id,不需要传nil
+(void)DPDtbtypesId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure;

////拼多多商品详情
//#define DPDpddgoods @"/miniapp/pdd/goods/"
//sign 用户邀请码
+(void)DPDpddgoodsId:(NSString *)objid Sign:(NSString *)sign success:(void(^) (BOOL isSuccess, id responseObject))success
             failure:(void(^) (NSError *error))failure;


////拼多多商品搜索/类目查看
//#define DPDpddsearch @"/miniapp/pdd/search"
+(void)DPDpddsearchSortType:(NSString *)sortType withCoupon:(NSString *)withCoupon optId:(NSString *)optId keyword:(NSString *)keyword page:(NSString *)page token:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                    failure:(void(^) (NSError *error))failure;

////获取短信验证码
//#define DPDgetCode @"/miniapp/getCode"
+(void)DPDgetCodeMobile:(NSString *)mobile token:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure;

////拼多多分类
//#define DPDpddtypes @"/miniapp/pdd/types"
+(void)DPDpddtypesId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
             failure:(void(^) (NSError *error))failure;

////拼多多商品分享图片
//#define DPDpddgoodsImg @"/miniapp/pdd/goodsImg/"
+(void)DPDpddgoodsImgToken:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                   failure:(void(^) (NSError *error))failure;

////登录
//#define DPDlogin @"/miniapp/login"
+(void)DPDloginCode:(NSString *)code encryptedData:(NSString *)encryptedData iv:(NSString *)iv inviterCode:(NSString *)inviterCode success:(void(^) (BOOL isSuccess, id responseObject))success
            failure:(void(^) (NSError *error))failure;

////热词
//#define DPDhotWord @"/miniapp/hotWord"
+(void)DPDhotWordSuccess:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure;

////淘宝关键字搜索/类目查看
//#define DPDtbsearch @"/miniapp/tb/search"
+(void)DPDtbsearchEndPrice:(NSString *)endPrice startPrice:(NSString *)startPrice sort:(NSString *)sort hasCoupon:(NSString *)hasCoupon needFreeShipment:(NSString *)needFreeShipment cat:(NSString *)cat q:(NSString *)q  pageNo:(NSString *)pageNo success:(void(^) (BOOL isSuccess, id responseObject))success
                   failure:(void(^) (NSError *error))failure;

////生成淘口令
//#define DPDtbtpwd @"/miniapp/tb/tpwd"
+(void)DPDtbtpwdText:(NSString *)text url:(NSString *)url logo:(NSString *)logo success:(void(^) (BOOL isSuccess, id responseObject))success
             failure:(void(^) (NSError *error))failure;

////我的订单
//#define DPDorderlist @"/miniapp/order/list"
/*
 订单状态：1.已付款 2.已结算 3.已失效；不传返回全部 4.确认收货
 订单来源：1.淘宝 2.京东 3.拼多多；不传返回全部
 */
+(void)DPDorderlistToken:(NSString *)token orderStatus:(NSString *)orderStatus orderSource:(NSString *)orderSource page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                 failure:(void(^) (NSError *error))failure;

////我的粉丝
//#define DPDuserfans @"/miniapp/user/fans"
+(void)DPDuserfansNikeName:(NSString *)nikeName token:(NSString *)token page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                   failure:(void(^) (NSError *error))failure;

////拼多多广告位
//#define DPDpddbanner @"/miniapp/pdd/banner"
+(void)DPDpddbannerTypeId:(NSString *)typeId success:(void(^) (BOOL isSuccess, id responseObject))success
                  failure:(void(^) (NSError *error))failure;
////收入明细
//#define DPDuserbill @"/miniapp/user/bill"
+(void)DPDuserbillToken:(NSString *)token begin:(NSString *)begin success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure;

////团队订单数
//#define DPDteamorderlist @"/miniapp/team/order/list"
+(void)DPDteamorderlistToken:(NSString *)token orderStatus:(NSString *)orderStatus orderSource:(NSString *)orderSource page:(NSString *)page success:(void(^) (BOOL isSuccess, id responseObject))success
                     failure:(void(^) (NSError *error))failure;

////用户报表
//#define DPDuserreport @"/miniapp/user/report"
+(void)DPDuserreportToken:(NSString *)token type:(NSString *)type success:(void(^) (BOOL isSuccess, id responseObject))success
                  failure:(void(^) (NSError *error))failure;

////提现
//#define DPDuserwithdraw @"/user/withdraw"
+(void)DPDuserwithdrawMobile:(NSString *)mobile token:(NSString *)token code:(NSString *)code money:(NSString *)money realname:(NSString *)realname alipay:(NSString *)alipay success:(void(^) (BOOL isSuccess, id responseObject))success
                     failure:(void(^) (NSError *error))failure;

////提现信息
//#define DPDuserwithdrawinfo @"/miniapp/user/withdraw/info"
+(void)DPDuserwithdrawinfoToken:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                        failure:(void(^) (NSError *error))failure;

////解绑手机号
//#define DPDuntyingMobile @"/miniapp/untyingMobile"
+(void)DPDuntyingMobileMobile:(NSString *)mobile token:(NSString *)token code:(NSString *)code success:(void(^) (BOOL isSuccess, id responseObject))success
                      failure:(void(^) (NSError *error))failure;
////个人中心
//#define DPDuserhome @"/miniapp/user/home"
+(void)DPDuserhomeToken:(NSString *)token success:(void(^) (BOOL isSuccess, id responseObject))success
                failure:(void(^) (NSError *error))failure;
////绑定手机号
//#define DPDminiappphone @"/miniapp/phone"
+(void)DPDminiappphoneEncryptedData:(NSString *)encryptedData iv:(NSString *)iv token:(NSString *)token mobile:(NSString *)mobile  code:(NSString *)code success:(void(^) (BOOL isSuccess, id responseObject))success
                            failure:(void(^) (NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
