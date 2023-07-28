package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.OmsMoneyInfoParam;
import com.macro.mall.dto.OmsOrderDeliveryParam;
import com.macro.mall.dto.OmsOrderDetail;
import com.macro.mall.dto.OmsOrderQueryParam;
import com.macro.mall.dto.OmsReceiverInfoParam;
import com.macro.mall.model.OmsOrder;
import com.macro.mall.service.OmsOrderService;
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
 * 订单管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "OmsOrderController", description = "订单管理")
@RequestMapping("/order")
public class OmsOrderController {

    private final OmsOrderService orderService;

    @ApiOperation("查询订单")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<OmsOrder>> list(
            final OmsOrderQueryParam queryParam,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<OmsOrder> orderList = orderService.list(queryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(orderList));
    }

    @ApiOperation("批量发货")
    @PostMapping(value = "/update/delivery")
    @ResponseBody
    public CommonResult<?> delivery(@RequestBody final List<OmsOrderDeliveryParam> deliveryParamList) {
        final int count = orderService.delivery(deliveryParamList);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量关闭订单")
    @PostMapping(value = "/update/close")
    @ResponseBody
    public CommonResult<?> close(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam final String note) {
        final int count = orderService.close(ids, note);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量删除订单")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<Long> ids) {
        final int count = orderService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取订单详情:订单信息、商品信息、操作记录")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<OmsOrderDetail> detail(@PathVariable final Long id) {
        final OmsOrderDetail orderDetailResult = orderService.detail(id);
        return CommonResult.success(orderDetailResult);
    }

    @ApiOperation("修改收货人信息")
    @PostMapping(value = "/update/receiverInfo")
    @ResponseBody
    public CommonResult<?> updateReceiverInfo(@RequestBody final OmsReceiverInfoParam receiverInfoParam) {
        final int count = orderService.updateReceiverInfo(receiverInfoParam);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改订单费用信息")
    @PostMapping(value = "/update/moneyInfo")
    @ResponseBody
    public CommonResult<?> updateReceiverInfo(@RequestBody final OmsMoneyInfoParam moneyInfoParam) {
        final int count = orderService.updateMoneyInfo(moneyInfoParam);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("备注订单")
    @PostMapping(value = "/update/note")
    @ResponseBody
    public CommonResult<?> updateNote(
            @RequestParam("id") final Long id,
            @RequestParam("note") final String note,
            @RequestParam("status") final Integer status) {
        final int count = orderService.updateNote(id, note, status);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
