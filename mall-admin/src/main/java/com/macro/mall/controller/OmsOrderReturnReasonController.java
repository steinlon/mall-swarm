package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.OmsOrderReturnReason;
import com.macro.mall.service.OmsOrderReturnReasonService;
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
 * 退货原因管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "OmsOrderReturnReasonController", description = "退货原因管理")
@RequestMapping("/returnReason")
public class OmsOrderReturnReasonController {

    private final OmsOrderReturnReasonService orderReturnReasonService;

    @ApiOperation("添加退货原因")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final OmsOrderReturnReason returnReason) {
        final int count = orderReturnReasonService.create(returnReason);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改退货原因")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final OmsOrderReturnReason returnReason) {
        final int count = orderReturnReasonService.update(id, returnReason);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量删除退货原因")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<Long> ids) {
        final int count = orderReturnReasonService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("分页查询全部退货原因")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<OmsOrderReturnReason>> list(
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<OmsOrderReturnReason> reasonList = orderReturnReasonService.list(pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(reasonList));
    }

    @ApiOperation("获取单个退货原因详情信息")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<OmsOrderReturnReason> getItem(@PathVariable final Long id) {
        final OmsOrderReturnReason reason = orderReturnReasonService.getItem(id);
        return CommonResult.success(reason);
    }

    @ApiOperation("修改退货原因启用状态")
    @PostMapping(value = "/update/status")
    @ResponseBody
    public CommonResult<?> updateStatus(
            @RequestParam(value = "status") final Integer status,
            @RequestParam("ids") final List<Long> ids) {
        final int count = orderReturnReasonService.updateStatus(ids, status);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
