package com.macro.mall.demo.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.service.FeignPortalService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Feign调用mall-portal接口示例
 */
@Api(tags = "FeignPortalController", description = "Feign调用mall-portal接口示例")
@RestController
@RequestMapping("/feign/portal")
@AllArgsConstructor
public class FeignPortalController {

    private final FeignPortalService portalService;

    @PostMapping("/login")
    public CommonResult<?> login(@RequestParam final String username, @RequestParam final String password) {
        return portalService.login(username, password);
    }

    @GetMapping("/cartList")
    public CommonResult<?> cartList() {
        return portalService.list();
    }
}
