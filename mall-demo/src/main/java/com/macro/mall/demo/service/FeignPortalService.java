package com.macro.mall.demo.service;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.constant.ServiceConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(ServiceConstant.PORTAL_SERVICE)
public interface FeignPortalService {

    @PostMapping("/sso/login")
    CommonResult<?> login(@RequestParam String username, @RequestParam String password);

    @GetMapping("/cart/list")
    CommonResult<?> list();
}
