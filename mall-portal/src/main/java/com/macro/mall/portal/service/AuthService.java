package com.macro.mall.portal.service;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.constant.ServiceConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * 认证服务远程调用
 */
@FeignClient(ServiceConstant.AUTH_SERVICE)
public interface AuthService {

    @PostMapping(value = "/oauth/token")
    CommonResult<?> getAccessToken(@RequestParam Map<String, String> parameters);

}
