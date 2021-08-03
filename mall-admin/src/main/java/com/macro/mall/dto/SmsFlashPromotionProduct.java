package com.macro.mall.dto;

import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.SmsFlashPromotionProductRelation;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 限时购及商品信息封装
 */
@Getter
@Setter
public class SmsFlashPromotionProduct extends SmsFlashPromotionProductRelation {

    @ApiModelProperty("关联商品")
    private PmsProduct product;
}
