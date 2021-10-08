package com.macro.mall.portal.domain;

import com.macro.mall.model.SmsCoupon;
import com.macro.mall.model.SmsCouponHistory;
import com.macro.mall.model.SmsCouponProductCategoryRelation;
import com.macro.mall.model.SmsCouponProductRelation;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 优惠券领取历史详情封装
 */
@Getter
@Setter
public class SmsCouponHistoryDetail extends SmsCouponHistory {
    //相关优惠券信息
    private SmsCoupon coupon;
    //优惠券关联商品
    private List<SmsCouponProductRelation> productRelationList;
    //优惠券关联商品分类
    private List<SmsCouponProductCategoryRelation> categoryRelationList;
}
