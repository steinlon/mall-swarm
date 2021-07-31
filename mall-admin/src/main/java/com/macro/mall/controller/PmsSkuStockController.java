package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.PmsSkuStock;
import com.macro.mall.service.PmsSkuStockService;
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
 * sku库存Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "PmsSkuStockController", description = "sku商品库存管理")
@RequestMapping("/sku")
public class PmsSkuStockController {

    private final PmsSkuStockService skuStockService;

    @ApiOperation("根据商品编号及编号模糊搜索sku库存")
    @GetMapping(value = "/{pid}")
    @ResponseBody
    public CommonResult<List<PmsSkuStock>> getList(
            @PathVariable final Long pid,
            @RequestParam(value = "keyword", required = false) final String keyword) {
        final List<PmsSkuStock> skuStockList = skuStockService.getList(pid, keyword);
        return CommonResult.success(skuStockList);
    }

    @ApiOperation("批量更新库存信息")
    @PostMapping(value = "/update/{pid}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long pid,
            @RequestBody final List<PmsSkuStock> skuStockList) {
        final int count = skuStockService.update(pid, skuStockList);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
