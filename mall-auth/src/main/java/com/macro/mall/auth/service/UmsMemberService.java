package com.macro.mall.auth.service;

import com.macro.mall.common.constant.ServiceConstant;
import com.macro.mall.common.domain.UserDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 前台会员服务远程调用Service
 * Created by macro on 2020/7/16.
 */
@FeignClient("mall-portal")
public interface UmsMemberService {

    @GetMapping("/sso/loadByUsername")
    UserDto loadUserByUsername(@RequestParam final String username);

}
