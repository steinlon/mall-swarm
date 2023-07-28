package com.macro.mall.portal.component;

import com.macro.mall.portal.domain.QueueEnum;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Component;

/**
 * 取消订单消息的发出者
 */
@AllArgsConstructor
@Component
@Slf4j
public class CancelOrderSender {

    private final AmqpTemplate amqpTemplate;

    public void sendMessage(final Long orderId, final long delayTimes) {
        //给延迟队列发送消息
        amqpTemplate.convertAndSend(
                QueueEnum.QUEUE_TTL_ORDER_CANCEL.getExchange(),
                QueueEnum.QUEUE_TTL_ORDER_CANCEL.getRouteKey(),
                orderId,
                message -> {
                    //给消息设置延迟毫秒值
                    message.getMessageProperties().setExpiration(String.valueOf(delayTimes));
                    return message;
                });
        log.info("send orderId:{}", orderId);
    }
}
