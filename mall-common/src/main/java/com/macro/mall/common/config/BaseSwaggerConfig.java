package com.macro.mall.common.config;

import com.macro.mall.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.Contact;
import springfox.documentation.service.HttpAuthenticationScheme;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.service.SecurityScheme;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.ArrayList;
import java.util.List;

/**
 * Swagger基础配置
 */
public abstract class BaseSwaggerConfig {

    @Bean
    public Docket createRestApi() {
        final SwaggerProperties swaggerProperties = swaggerProperties();
        final Docket docket = new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo(swaggerProperties))
                .select()
                .apis(RequestHandlerSelectors.basePackage(swaggerProperties.getApiBasePackage()))
                .paths(PathSelectors.any())
                .build();
        if (swaggerProperties.isEnableSecurity()) {
            docket.securitySchemes(securitySchemes()).securityContexts(securityContexts());
        }
        return docket;
    }

    private ApiInfo apiInfo(final SwaggerProperties swaggerProperties) {
        return new ApiInfoBuilder()
                .title(swaggerProperties.getTitle())
                .description(swaggerProperties.getDescription())
                .contact(new Contact(swaggerProperties.getContactName(), swaggerProperties.getContactUrl(), swaggerProperties.getContactEmail()))
                .version(swaggerProperties.getVersion())
                .build();
    }

    private List<SecurityScheme> securitySchemes() {
        //设置请求头信息
        final List<SecurityScheme> result = new ArrayList<>();
        final ApiKey apiKey = new ApiKey("Authorization", "Authorization", "header");
        final HttpAuthenticationScheme jwt = HttpAuthenticationScheme.JWT_BEARER_BUILDER.name("JWT").build();
        result.add(apiKey);
        return result;
    }

    private List<SecurityContext> securityContexts() {
        //设置需要登录认证的路径
        final List<SecurityContext> result = new ArrayList<>();
        final SecurityContext context = SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex("/*/.*"))
                .build();
        result.add(context);
        return result;
    }

    private List<SecurityReference> defaultAuth() {
        final List<SecurityReference> result = new ArrayList<>();
        final AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        result.add(new SecurityReference("Authorization", new AuthorizationScope[]{authorizationScope}));
        result.add(new SecurityReference("JWT", new AuthorizationScope[]{authorizationScope}));
        return result;
    }

    /**
     * 自定义Swagger配置
     */
    public abstract SwaggerProperties swaggerProperties();
}
