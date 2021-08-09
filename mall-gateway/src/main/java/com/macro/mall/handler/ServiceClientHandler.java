package com.macro.mall.handler;

import com.macro.mall.common.constant.ServiceConstant;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RestController
@AllArgsConstructor
@Api(tags = "ServiceClientHandler")
public class ServiceClientHandler {

    private final DiscoveryClient discoveryClient;
    private final LoadBalancerClient loadBalancerClient;

    @GetMapping("/discoveryClient")
    public DiscoveryClient getDiscoveryClient() {
        return this.discoveryClient;
    }

    @GetMapping("/serviceInstances")
    public List<ServiceInstance> getDiscoveryClientServiceInstances() {
        return this.discoveryClient.getInstances(ServiceConstant.GATEWAY_SERVICE);
    }

    @GetMapping("/adminServices")
    public String getAdminLoadBalancerClient() {
        final ServiceInstance serviceInstance = loadBalancerClient.choose(ServiceConstant.ADMIN_SERVICE);
        return new RestTemplate().getForObject(serviceInstance.getUri() + "/serviceInstances", String.class);
    }

    @GetMapping("/authServices")
    public String getAuthLoadBalancerClient() {
        final ServiceInstance serviceInstance = loadBalancerClient.choose(ServiceConstant.AUTH_SERVICE);
        return new RestTemplate().getForObject(serviceInstance.getUri() + "/serviceInstances", String.class);
    }
}
