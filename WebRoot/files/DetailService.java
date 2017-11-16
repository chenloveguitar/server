package com.magicmoble.luzhouapp.mvp.model.api.service;

import com.magicmoble.luzhouapp.mvp.model.entity.AliPayResponse;
import com.magicmoble.luzhouapp.mvp.model.entity.BaseJson;
import com.magicmoble.luzhouapp.mvp.model.entity.Detail;
import com.magicmoble.luzhouapp.mvp.model.entity.Detail.FavourUser;
import com.magicmoble.luzhouapp.mvp.model.entity.Detail.ReplyComment;
import com.magicmoble.luzhouapp.mvp.model.entity.Favour;
import com.magicmoble.luzhouapp.mvp.model.entity.FindItem;
import com.magicmoble.luzhouapp.mvp.model.entity.MessageResponse;
import com.magicmoble.luzhouapp.mvp.model.entity.RewardUser;
import com.magicmoble.luzhouapp.mvp.model.entity.WXPayResponse;

import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;
import retrofit2.http.Query;
import rx.Observable;

/**
 * Created by Administrator on 2017/5/23 0023.
 */

public interface DetailService {

    /**
     * 请求今日头条详情
     *
     * @param id     头条ID
     * @param userId 用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("Toutiao_clickInq")
    Observable<BaseJson<Detail>> requestHeadline(@Field("id") String id, @Field("my_id") String userId);

    /**
     * 请求酒城日记详情
     *
     * @param id     日记ID
     * @param userId 用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("Toutiao_clickInq")
    Observable<BaseJson<Detail>> requestDiary(@Field("id") String id, @Field("my_id") String userId);

    /**
     * 请求发现秘密详情
     *
     * @param id     发现秘密ID
     * @param userId 用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("Faxian_clickInq")
    Observable<BaseJson<Detail>> requestSecret(@Field("id") String id, @Field("my_id") String userId);

    /**
     * 请求物品/服务详情
     *
     * @param id            物品/服务ID
     * @param commodityType 物品=1，服务=2
     * @param userId        用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("Guangjie_clickInq")
    Observable<BaseJson<Detail>> requestCommodity(@Field("id") String id, @Field("guangjie_fenlei_Tag") int commodityType, @Field("my_id") String userId);

    /**
     * 请求店铺详情(发现-有去处)
     *
     * @param id     店铺ID
     * @param userId 用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("Quchu_clickInq")
    Observable<BaseJson<Detail>> requestShop(@Field("id") String id, @Field("my_id") String userId);

    /**
     * 请求评论
     *
     * @param id     物品ID
     * @param page   页面索引
     * @param userId 用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("Pinglun_listInq")
    Observable<BaseJson<Detail.Comment>> requestAddComment(@Field("id") String id, @Field("page") int page, @Field("my_id") String userId);

    /**
     * 回复评论
     *
     * @return
     */
    @FormUrlEncoded
    @POST("AddHuifu")
    Observable<BaseJson<ReplyComment>> replyComment(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("content") String content);

    /**
     * 获取评论详情列表
     *
     * @param id
     * @param user
     * @param pageIndex
     * @return
     */
    @FormUrlEncoded
    @POST("Huifu_listInq")
    Observable<BaseJson<ReplyComment>> commentDetailList(@Field("tiaomu_id") String id, @Field("my_id") String user, @Field("page") int pageIndex);

    /**
     * 获取评论点赞人员列表
     *
     * @param id
     * @return
     */
    @FormUrlEncoded
    @POST("Getdianzan_count?dianzan_Tag=7")
    Observable<BaseJson<FavourUser>> commentFavourUsers(@Field("tiaomu_id") String id);

    /**
     * 获取打赏
     *
     * @param id     详情ID
     * @param userId 用户ID
     * @return
     */
    @FormUrlEncoded
    @POST("DashangInq")
    Observable<BaseJson<RewardUser>> requestRewardUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("releaser_id") String releaseId);

    /**
     * 推荐订单
     *
     * @param id          详情ID
     * @param userId      用户ID
     * @param recomentDay 推荐天数
     * @param favourCount 点赞红包个数
     * @param favourMoney 点赞红包金额
     * @param shareCount  分享红包个数
     * @param shareMoney  分享红包金额
     * @return
     */
    @FormUrlEncoded
    @POST("Tuijian_clickInq")
    Observable<MessageResponse> recommenOrder(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("tuijian_tianshu") int recomentDay, @Field("dianzan_hongbao_counts") int favourCount
            , @Field("dianzan_hongbao_price") double favourMoney, @Field("fenxiang_hongbao_count") int shareCount, @Field("fenxiang_hongbao_price") double shareMoney);

    /**
     * 发现秘密,点赞用户列表
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_listInq?dianzan_Tag=4")
    Observable<BaseJson<Favour.User>> secretFavourUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("page") int pageIndex);

    /**
     * 今日头条，点赞用户列表
     *
     * @param id
     * @param userId
     * @param pageIndex
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_listInq?dianzan_Tag=3")
    Observable<BaseJson<Favour.User>> headlineFavourUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("page") int pageIndex);

    /**
     * 酒城日记点赞用户列表
     *
     * @param id
     * @param userId
     * @param pageIndex
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_listInq?dianzan_Tag=3")
    Observable<BaseJson<Favour.User>> diaryFavourUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("page") int pageIndex);

    /**
     * 有去处点赞用户列表
     *
     * @param id
     * @param userId
     * @param pageIndex
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_listInq?dianzan_Tag=1")
    Observable<BaseJson<Favour.User>> shopFavourUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("page") int pageIndex);

    /**
     * 商品点赞用户列表
     *
     * @param id
     * @param userId
     * @param pageIndex
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_listInq?dianzan_Tag=6")
    Observable<BaseJson<Favour.User>> commodtiyFavourUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("page") int pageIndex);

    /**
     * 服务点赞用户列表
     *
     * @param id
     * @param userId
     * @param pageIndex
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_listInq?dianzan_Tag=5")
    Observable<BaseJson<Favour.User>> serverFavourUsers(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("page") int pageIndex);

    /**
     * 关注用户
     *
     * @param id     被关注用户ID
     * @param userId 用户ID
     * @param isCare 1:关注，2：取消关注
     * @return
     */
    @FormUrlEncoded
    @POST("AddGuanzhuInq")
    Observable<MessageResponse> requestCare(@Field("friend_id") String id, @Field("my_id") String userId, @Field("focus_Tag") int isCare);

    /**
     * 收藏头条
     *
     * @param id
     * @param userId
     * @param isCollect
     * @return
     */
    @FormUrlEncoded
    @POST("Shoucang_clickInq?shoucang_fenlei_Tag=1&guangjie_fenlei_Tag=2")
    Observable<MessageResponse> handlineCollect(@Field("duixiang_id") String id, @Field("my_id") String userId, @Field("shoucang_Tag") boolean isCollect);

    /**
     * 收藏发现秘密
     *
     * @param id
     * @param userId
     * @param isCollect
     * @return
     */
    @FormUrlEncoded
    @POST("Shoucang_clickInq?shoucang_fenlei_Tag=2&guangjie_fenlei_Tag=2")
    Observable<MessageResponse> secretCollect(@Field("duixiang_id") String id, @Field("my_id") String userId, @Field("shoucang_Tag") boolean isCollect);

    /**
     * 收藏有去处（店铺）
     *
     * @param id
     * @param userId
     * @param isCollect
     * @return
     */
    @FormUrlEncoded
    @POST("Shoucang_clickInq?shoucang_fenlei_Tag=3&guangjie_fenlei_Tag=2")
    Observable<MessageResponse> shopCollect(@Field("duixiang_id") String id, @Field("my_id") String userId, @Field("shoucang_Tag") boolean isCollect);

    /**
     * 收藏物品
     *
     * @param id
     * @param userId
     * @param isCollect
     * @return
     */
    @FormUrlEncoded
    @POST("Shoucang_clickInq?shoucang_fenlei_Tag=4&guangjie_fenlei_Tag=1")
    Observable<MessageResponse> commodityCollect(@Field("duixiang_id") String id, @Field("my_id") String userId, @Field("shoucang_Tag") boolean isCollect);

    /**
     * 收藏服务
     *
     * @param id
     * @param userId
     * @param isCollect
     * @return
     */
    @FormUrlEncoded
    @POST("Shoucang_clickInq?shoucang_fenlei_Tag=4&guangjie_fenlei_Tag=2")
    Observable<MessageResponse> serverCollect(@Field("duixiang_id") String id, @Field("my_id") String userId, @Field("shoucang_Tag") boolean isCollect);

    /**
     * 评论点赞
     *
     * @param id       被点赞ID
     * @param userId   用户ID
     * @param isFavour 1:点赞，2：取消点赞
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=7")
    Observable<MessageResponse> commentFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("cancel") int isFavour, @Field("releaser_id") String releaserId);

    /**
     * 评论回复点赞
     *
     * @param id       被点赞ID
     * @param userId   用户ID
     * @param isFavour 1:点赞，2：取消点赞
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=8")
    Observable<MessageResponse> replyFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("cancel") int isFavour, @Field("releaser_id") String releaserId);

    /**
     * 头条文章点赞
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=3&cancel=1")
    Observable<MessageResponse> handlineFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("releaser_id") String releaserId);

    /**
     * 发现秘密点赞
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=4&cancel=1")
    Observable<MessageResponse> secretFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("releaser_id") String releaserId);

    /**
     * 有去处点赞
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=1&cancel=1")
    Observable<MessageResponse> shopFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("releaser_id") String releaserId);

    /**
     * 服务点赞
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=5&cancel=1")
    Observable<MessageResponse> serverFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("releaser_id") String releaserId);

    /**
     * 商品点赞
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Dianzan_clickInq?dianzan_Tag=6&cancel=1")
    Observable<MessageResponse> commodityFavour(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("releaser_id") String releaserId);

    /**
     * 添加评论
     *
     * @param id
     * @param userId
     * @param comment
     * @return
     */
    @FormUrlEncoded
    @POST("AddPinglunInq")
    Observable<BaseJson<Detail.Comment>> requestAddComment(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("content") String comment);

    /**
     * 商品订单
     *
     * @param id         商品Id
     * @param userId     用户ID
     * @param count      购买数量
     * @param buyId      收货人ID
     * @param buyName    收货人姓名
     * @param buyPhone   收货人电话
     * @param buyAddress 收货地址
     * @param memo       备注
     * @return
     */
    @FormUrlEncoded
    @POST("Add_DingdanInq?guangjie_fenlei_Tag=1")
    Observable<MessageResponse> commodityOrder(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("shuliang") int count, @Field("buyer_id") String buyId, @Field("buyer_name") String buyName, @Field("buyer_phone") String buyPhone, @Field("address") String buyAddress, @Field("beizhu") String memo, @Field("guangjie_fenlei_Tag") String type);

    /**
     * 头条举报
     *
     * @param id
     * @param userId
     * @param inform
     * @return
     */
    @FormUrlEncoded
    @POST("Jubao_clickInq?fenlei_Tag=1")
    Observable<MessageResponse> headlineInform(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("content") String inform);

    /**
     * 发现秘密举报
     *
     * @param id
     * @param userId
     * @param content
     * @return
     */
    @FormUrlEncoded
    @POST("Jubao_clickInq?fenlei_Tag=2")
    Observable<MessageResponse> secretInform(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("content") String content);

    /**
     * 有去处举报
     *
     * @param id
     * @param userId
     * @param content
     * @return
     */
    @FormUrlEncoded
    @POST("Jubao_clickInq?fenlei_Tag=3")
    Observable<MessageResponse> shopInform(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("content") String content);

    /**
     * 商品/服务举报
     *
     * @param id
     * @param userId
     * @param content
     * @return
     */
    @FormUrlEncoded
    @POST("Jubao_clickInq?fenlei_Tag=4")
    Observable<MessageResponse> commodityInform(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("content") String content);

    /**
     * 头条添加打赏用户信息
     *
     * @param price
     * @param userId
     * @param toId
     * @param id
     * @return
     */
    @FormUrlEncoded
    @POST("Dashang_clickInq?fenlei_Tag=1")
    Observable<MessageResponse> headlineRewardUser(@Field("dashang_price") String price, @Field("my_id") String userId, @Field("duixiang_id") String toId, @Field("tiaomu_id") String id, @Field("releaser_id") String releaserId);

    /**
     * 发现秘密添加打赏用户信息
     *
     * @param price
     * @param userId
     * @param toId
     * @param id
     * @return
     */
    @FormUrlEncoded
    @POST("Dashang_clickInq?fenlei_Tag=2")
    Observable<MessageResponse> secretRewardUser(@Field("dashang_price") String price, @Field("my_id") String userId, @Field("duixiang_id") String toId, @Field("tiaomu_id") String id, @Field("releaser_id") String releaserId);


    /**
     * 有去处添加打赏用户信息
     *
     * @param price
     * @param userId
     * @param toId
     * @param id
     * @return
     */
    @FormUrlEncoded
    @POST("Dashang_clickInq?fenlei_Tag=3")
    Observable<MessageResponse> shopRewardUser(@Field("dashang_price") String price, @Field("my_id") String userId, @Field("duixiang_id") String toId, @Field("tiaomu_id") String id, @Field("releaser_id") String releaserId);


    /**
     * 商品服务添加打赏用户信息
     *
     * @param price
     * @param userId
     * @param toId
     * @param id
     * @return
     */
    @FormUrlEncoded
    @POST("Dashang_clickInq?fenlei_Tag=4")
    Observable<MessageResponse> commodityRewardUser(@Field("dashang_price") String price, @Field("my_id") String userId, @Field("duixiang_id") String toId, @Field("tiaomu_id") String id, @Field("releaser_id") String releaserId);

    /**
     * 微信支付
     *
     * @param orderContent
     * @param price
     * @return
     */
    @POST("Weixin_Pay")
    Observable<WXPayResponse> requestWechatPay(@Query(value = "orderContent") String orderContent, @Query("price") String price);

    /**
     * 支付宝支付
     *
     * @param orderContent
     * @param price
     * @param orderName
     * @return
     */
    @FormUrlEncoded
    @POST("Ali_Pay")
    Observable<AliPayResponse> requestAliPay(@Field("orderContent") String orderContent, @Field("price") String price, @Field("orderName") String orderName);

    /**
     * 钱包支付
     *
     * @param userId       用户ID
     * @param rewardUserId 打赏人ID
     * @param price        金额
     * @param type         用途
     * @return
     */
    @FormUrlEncoded
    @POST("PayInq")
    Observable<MessageResponse> requestPay(@Field("my_id") String userId, @Field("duixiang_id") String rewardUserId, @Field("price") String price, @Field("type") String order);

    /**
     * 逛街
     *
     * @param id
     * @param userId
     * @return
     */
    @FormUrlEncoded
    @POST("Guangguang")
    Observable<BaseJson<FindItem>> requestShopping(@Field("dianpu_id") String id, @Field("my_id") String userId, @Field("page") int page);

    /**
     * 订单支付宝支付
     * @param orderContent
     * @param price
     * @param orderName
     * @param orderId
     * @return
     */
    @FormUrlEncoded
    @POST("Ali_Pay_BuyInq")
    Observable<AliPayResponse> requestOrderAliPay(@Field("my_id") String userId, @Field("orderContent") String orderContent, @Field("price") String price, @Field("orderName") String orderName, @Field("transaction_id") String orderId);

    /**
     * 订单微信支付
     * @param userId
     * @param orderContent
     * @param price
     * @param orderId
     * @return
     */
    @FormUrlEncoded
    @POST("Weixin_Pay_BuyInq")
    Observable<WXPayResponse> requestOrderWXPay(@Field("my_id") String userId, @Field("orderContent") String orderContent, @Field("price") String price, @Field("transaction_id") String orderId);

    /**
     * 分享红包
     * @param id 详情ID
     * @param userId 用户ID
     * @param type
     * @return
     */
    @FormUrlEncoded
    @POST("Hongbao_clickInq?hongbao_Tag=2")
    Observable<MessageResponse> shareLuckyMoney(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("fenlei_Tag") String type);

    /**
     * 点赞红包
     * @param id 详情ID
     * @param userId 用户ID
     * @param type
     * @return
     */
    @FormUrlEncoded
    @POST("Hongbao_clickInq?hongbao_Tag=1")
    Observable<MessageResponse> favourLuckyMoney(@Field("tiaomu_id") String id, @Field("my_id") String userId, @Field("fenlei_Tag") String type);
}
