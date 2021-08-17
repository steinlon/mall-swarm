package com.macro.mall.common.propertirs;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties;
import org.springframework.boot.autoconfigure.amqp.RabbitProperties;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;

@Data
@AllArgsConstructor
public class SystemProperties {

    private final RedisProperties redisProperties;
    private final OAuth2ResourceServerProperties oAuth2ResourceServerProperties;
    private final RabbitProperties rabbitProperties;
    private final AliyunProperties aliyunProperty;
    private final WebEndpointProperties webEndpointProperties;
    private final String profile;
}
