package com.macro.mall.demo.controller;

/**
 * Created by macro on 2019/10/18.
 */

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.dto.UmsAdminLoginParam;
import com.macro.mall.demo.service.FeignAdminService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Feign调用mall-admin接口示例
 */
@Api(tags = "FeignAdminController", description = "Feign调用mall-admin接口示例")
@RestController
@RequestMapping("/feign/admin")
@AllArgsConstructor
public class FeignAdminController {

    private final FeignAdminService adminService;

    @PostMapping("/login")
    public CommonResult<?> login(@RequestBody final UmsAdminLoginParam loginParam) {
        return adminService.login(loginParam);
    }

    @GetMapping("/getBrandList")
    public CommonResult<?> getBrandList() {
        return adminService.getList();
    }
}
