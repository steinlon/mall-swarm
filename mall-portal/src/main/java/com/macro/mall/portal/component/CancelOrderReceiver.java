package com.macro.mall.portal.component;

import com.macro.mall.portal.service.OmsPortalOrderService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * 取消订单消息的处理者
 */
@AllArgsConstructor
@Component
@RabbitListener(queues = "mall.order.cancel")
@Slf4j
public class CancelOrderReceiver {

    private final OmsPortalOrderService portalOrderService;

    @RabbitHandler
    public void handle(final Long orderId) {
        portalOrderService.cancelOrder(orderId);
        log.info("process orderId:{}", orderId);
    }
}
