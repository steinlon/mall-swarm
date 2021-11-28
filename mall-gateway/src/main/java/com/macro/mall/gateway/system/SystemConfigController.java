package com.macro.mall.gateway.system;

import com.macro.mall.common.constant.ServiceConstant;
import com.macro.mall.common.propertirs.SystemProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.autoconfigure.endpoint.web.WebEndpointProperties;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.List;

@RestController
@RefreshScope
public class SystemConfigController {

    private final SystemProperties systemProperties;
    private final DiscoveryClient discoveryClient;
    private final LoadBalancerClient loadBalancerClient;
    private final WebClient.Builder webClientBuilder;

    @Autowired
    public SystemConfigController(
            final RedisProperties redisProperties,
            final OAuth2ResourceServerProperties oAuth2ResourceServerProperties,
            final WebEndpointProperties webEndpointProperties,
            @Value("${info.profile}") final String profile,
            final DiscoveryClient discoveryClient,
            final LoadBalancerClient loadBalancerClient,
            final WebClient.Builder webClientBuilder) {
        this.discoveryClient = discoveryClient;
        this.loadBalancerClient = loadBalancerClient;
        this.webClientBuilder = webClientBuilder;
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

    @GetMapping("/discoveryClient")
    public DiscoveryClient getDiscoveryClient() {
        return this.discoveryClient;
    }

    @GetMapping("/serviceInstances")
    public List<ServiceInstance> getDiscoveryClientServiceInstances() {
        return this.discoveryClient.getInstances(ServiceConstant.GATEWAY_SERVICE);
    }

    @GetMapping("/adminServices")
    public Mono<String> getAdminLoadBalancerClient() {
        final ServiceInstance serviceInstance = loadBalancerClient.choose(ServiceConstant.ADMIN_SERVICE);
        return webClientBuilder.build()
                .get()
                .uri(serviceInstance.getUri() + "/serviceInstances")
                .retrieve()
                .bodyToMono(String.class);
    }

    @GetMapping("/authServices")
    public Mono<String> getAuthLoadBalancerClient() {
        final ServiceInstance serviceInstance = loadBalancerClient.choose(ServiceConstant.AUTH_SERVICE);
        return webClientBuilder.build()
                .get()
                .uri(serviceInstance.getUri() + "/serviceInstances")
                .retrieve()
                .bodyToMono(String.class);
    }
}
