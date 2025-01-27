package com.macro.mall.demo.component;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
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
                    String name = headerNames.nextElement();
                    String values = request.getHeader(name);
                    //请求头的值为JSON格式时有截断问题
                    if("user".equals(name)&&StrUtil.isNotEmpty(values)){
                        JSONObject jsonObject = JSONUtil.parseObj(values);
                        String id = jsonObject.getStr("id");
                        values = JSONUtil.createObj().putOnce("id",id).toString();
                    }
                    requestTemplate.header(name, values);
                }
            }
        }
    }
}
