package com.macro.mall.auth.system;

import com.macro.mall.common.constant.ServiceConstant;
import com.macro.mall.common.propertirs.SystemProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.macro.mall.common.constant.UrlConstant.SYSTEM;

@RestController
@RefreshScope
@RequestMapping(SYSTEM)
public class SystemConfigController {

    private final SystemProperties systemProperties;
    private final DiscoveryClient discoveryClient;

    @Autowired
    public SystemConfigController(
            final WebEndpointProperties webEndpointProperties,
            @Value("${info.profile}") final String profile,
            final DiscoveryClient discoveryClient) {
        this.discoveryClient = discoveryClient;
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

    @GetMapping("/serviceInstances")
    public List<ServiceInstance> getDiscoveryClient() {
        return this.discoveryClient.getInstances(ServiceConstant.AUTH_SERVICE);
    }

    @GetMapping("/discoveryClient")
    public DiscoveryClient getClient() {
        return this.discoveryClient;
    }
}
