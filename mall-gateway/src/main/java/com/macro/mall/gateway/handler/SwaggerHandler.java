package com.macro.mall.gateway.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;
import springfox.documentation.swagger.web.SecurityConfiguration;
import springfox.documentation.swagger.web.SecurityConfigurationBuilder;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger.web.UiConfigurationBuilder;

import java.util.List;
import java.util.Optional;

/**
 * 自定义Swagger的各个配置节点
 */
@RestController
public class SwaggerHandler {

    private final SecurityConfiguration securityConfiguration;
    private final UiConfiguration uiConfiguration;
    private final SwaggerResourcesProvider swaggerResources;

    public SwaggerHandler(
            final SwaggerResourcesProvider swaggerResources,
            @Autowired(required = false) final SecurityConfiguration securityConfiguration,
            @Autowired(required = false) final UiConfiguration uiConfiguration) {
        this.swaggerResources = swaggerResources;
        this.securityConfiguration = securityConfiguration;
        this.uiConfiguration = uiConfiguration;
    }

    /**
     * Swagger安全配置，支持oauth和apiKey设置
     */
    @GetMapping("/swagger-resources/configuration/security")
    public Mono<ResponseEntity<SecurityConfiguration>> securityConfiguration() {
        return Mono.just(
                new ResponseEntity<>(
                        Optional.ofNullable(securityConfiguration)
                                .orElse(SecurityConfigurationBuilder.builder().build()),
                        HttpStatus.OK)
        );
    }

    /**
     * Swagger UI配置
     */
    @GetMapping("/swagger-resources/configuration/ui")
    public Mono<ResponseEntity<UiConfiguration>> uiConfiguration() {
        return Mono.just(
                new ResponseEntity<>(
                        Optional.ofNullable(uiConfiguration)
                                .orElse(UiConfigurationBuilder.builder().build()),
                        HttpStatus.OK)
        );
    }

    /**
     * Swagger资源配置，微服务中这各个服务的api-docs信息
     */
    @GetMapping("/swagger-resources")
    public Mono<ResponseEntity<List<SwaggerResource>>> swaggerResources() {
        return Mono.just(new ResponseEntity<>(swaggerResources.get(), HttpStatus.OK));
    }
}
