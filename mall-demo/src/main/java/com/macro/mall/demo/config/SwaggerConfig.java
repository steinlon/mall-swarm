package com.macro.mall.demo.config;

import com.macro.mall.common.config.BaseSwaggerConfig;
import com.macro.mall.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import static com.macro.mall.common.constant.ServiceConstant.SWAGGER_VERSION;

/**
 * Swagger API文档相关配置
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.macro.mall.demo.controller")
                .title("mall-demo系统")
                .description("SpringCloud版本中的一些示例")
                .contactName("macro")
                .version(SWAGGER_VERSION)
                .enableSecurity(true)
                .build();
    }

}
