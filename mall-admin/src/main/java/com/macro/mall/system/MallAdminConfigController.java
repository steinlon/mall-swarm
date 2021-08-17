package com.macro.mall.system;

import com.macro.mall.common.propertirs.AliyunProperties;
import com.macro.mall.common.propertirs.SystemProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties;
import org.springframework.boot.autoconfigure.amqp.RabbitProperties;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@EnableConfigurationProperties({AliyunProperties.class})
public class MallAdminConfigController {

    private final SystemProperties systemProperties;

    @Autowired
    public MallAdminConfigController(
            final RedisProperties redisProperties,
            final AliyunProperties aliyunProperties,
            final RabbitProperties rabbitProperties,
            final WebEndpointProperties webEndpointProperties,
            @Value("${info.profile}") final String profile) {
        this.systemProperties = new SystemProperties(
                redisProperties,
                null,
                rabbitProperties,
                aliyunProperties,
                webEndpointProperties,
                profile
        );
    }

    @GetMapping("/configs")
    public SystemProperties getProfile() {
        return this.systemProperties;
    }
}
