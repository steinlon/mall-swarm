package com.macro.mall.system;

import com.macro.mall.common.propertirs.SystemProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
public class MallGatewayConfigController {

    private final SystemProperties systemProperties;

    @Autowired
    public MallGatewayConfigController(
            final RedisProperties redisProperties,
            final OAuth2ResourceServerProperties oAuth2ResourceServerProperties,
            final WebEndpointProperties webEndpointProperties,
            @Value("${info.profile}") final String profile) {
        this.systemProperties = new SystemProperties(
                redisProperties,
                oAuth2ResourceServerProperties,
                null,
                null,
                webEndpointProperties,
                profile
        );
    }

    @GetMapping("/configs")
    public SystemProperties getProfile() {
        return this.systemProperties;
    }
}
