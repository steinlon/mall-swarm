package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.OmsOrderSetting;
import com.macro.mall.service.OmsOrderSettingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 订单设置Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "OmsOrderSettingController", description = "订单设置管理")
@RequestMapping("/orderSetting")
public class OmsOrderSettingController {

    private final OmsOrderSettingService orderSettingService;

    @ApiOperation("获取指定订单设置")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<OmsOrderSetting> getItem(@PathVariable final Long id) {
        final OmsOrderSetting orderSetting = orderSettingService.getItem(id);
        return CommonResult.success(orderSetting);
    }

    @ApiOperation("修改指定订单设置")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final OmsOrderSetting orderSetting) {
        final int count = orderSettingService.update(id, orderSetting);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
