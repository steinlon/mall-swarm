package com.macro.mall.demo.component;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * 用于Feign传递请求头的拦截器
 */
public class FeignRequestInterceptor implements RequestInterceptor {
    @Override
    public void apply(final RequestTemplate requestTemplate) {
        final ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            final HttpServletRequest request = attributes.getRequest();
            final Enumeration<String> headerNames = request.getHeaderNames();
            if (headerNames != null) {
                while (headerNames.hasMoreElements()) {
                    final String name = headerNames.nextElement();
                    requestTemplate.header(
                            headerNames.nextElement(),
                            request.getHeader(name)
                    );
                }
            }
        }
    }
}
