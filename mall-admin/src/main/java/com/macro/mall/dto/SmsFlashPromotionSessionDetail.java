package com.macro.mall.dto;

import com.macro.mall.model.SmsFlashPromotionSession;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 包含商品数量的场次信息
 */
@Setter
@Getter
public class SmsFlashPromotionSessionDetail extends SmsFlashPromotionSession {

    @ApiModelProperty("商品数量")
    private Long productCount;
}
