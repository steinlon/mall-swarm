package com.macro.mall.auth.service;

import com.macro.mall.common.constant.ServiceConstant;
import com.macro.mall.common.domain.UserDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(ServiceConstant.PORTAL_SERVICE)
public interface UmsMemberService {

    @GetMapping("/sso/loadByUsername")
    UserDto loadUserByUsername(@RequestParam final String username);

}
