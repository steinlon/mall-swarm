package com.macro.mall.service;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.constant.ServiceConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * 认证服务远程调用接口RPC，类似于mall-auth服务的本地调用
 */
@FeignClient(ServiceConstant.AUTH_SERVICE)
public interface AuthService {

    @PostMapping(value = "/oauth/token")
    CommonResult<?> getAccessToken(@RequestParam final Map<String, String> parameters);

}
