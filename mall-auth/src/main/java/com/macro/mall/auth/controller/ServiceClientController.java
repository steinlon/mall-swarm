package com.macro.mall.auth.controller;

import com.macro.mall.common.constant.ServiceConstant;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@Api(tags = "ServiceClientController")
public class ServiceClientController {

    private final DiscoveryClient discoveryClient;

    @GetMapping("/serviceInstances")
    public List<ServiceInstance> getDiscoveryClient() {
        return this.discoveryClient.getInstances(ServiceConstant.AUTH_SERVICE);
    }
}
