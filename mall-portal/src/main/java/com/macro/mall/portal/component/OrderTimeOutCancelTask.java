package com.macro.mall.portal.component;

import com.macro.mall.portal.service.OmsPortalOrderService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 订单超时取消并解锁库存的定时器
 */
@AllArgsConstructor
@Component
@Slf4j
public class OrderTimeOutCancelTask {

    private final OmsPortalOrderService portalOrderService;

    /**
     * cron表达式：Seconds Minutes Hours Day-of-Month Month Day-of-Week [Year]
     * 每10分钟扫描一次，扫描设定超时时间之前下的订单，如果没支付则取消该订单
     */
    @Scheduled(cron = "0 0/10 * ? * ?")
    private void cancelTimeOutOrder() {
        final Integer count = portalOrderService.cancelTimeOutOrder();
        log.info("取消订单，并根据sku编号释放锁定库存，取消订单数量：{}", count);
    }
}
