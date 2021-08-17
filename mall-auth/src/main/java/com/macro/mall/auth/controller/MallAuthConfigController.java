package com.macro.mall.auth.controller;

import com.macro.mall.common.propertirs.SystemProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
public class MallAuthConfigController {

    private final SystemProperties systemProperties;

    @Autowired
    public MallAuthConfigController(
            final WebEndpointProperties webEndpointProperties,
            @Value("${info.profile}") final String profile) {
        this.systemProperties = new SystemProperties(
                null,
                null,
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
