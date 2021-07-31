package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.SmsHomeAdvertise;
import com.macro.mall.service.SmsHomeAdvertiseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 首页轮播广告管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "SmsHomeAdvertiseController", description = "首页轮播广告管理")
@RequestMapping("/home/advertise")
public class SmsHomeAdvertiseController {

    private final SmsHomeAdvertiseService advertiseService;

    @ApiOperation("添加广告")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final SmsHomeAdvertise advertise) {
        final int count = advertiseService.create(advertise);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("删除广告")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<Long> ids) {
        final int count = advertiseService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改上下线状态")
    @PostMapping(value = "/update/status/{id}")
    @ResponseBody
    public CommonResult<?> updateStatus(
            @PathVariable final Long id,
            @RequestParam(value = "status") final Integer status) {
        final int count = advertiseService.updateStatus(id, status);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取广告详情")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<SmsHomeAdvertise> getItem(@PathVariable final Long id) {
        final SmsHomeAdvertise advertise = advertiseService.getItem(id);
        return CommonResult.success(advertise);
    }

    @ApiOperation("修改广告")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(@PathVariable final Long id, @RequestBody final SmsHomeAdvertise advertise) {
        final int count = advertiseService.update(id, advertise);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("分页查询广告")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<SmsHomeAdvertise>> list(
            @RequestParam(value = "name", required = false) final String name,
            @RequestParam(value = "type", required = false) final Integer type,
            @RequestParam(value = "endTime", required = false) final String endTime,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<SmsHomeAdvertise> advertiseList = advertiseService.list(name, type, endTime, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(advertiseList));
    }
}
