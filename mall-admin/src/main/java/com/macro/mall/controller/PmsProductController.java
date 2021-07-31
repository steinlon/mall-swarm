package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.PmsProductParam;
import com.macro.mall.dto.PmsProductQueryParam;
import com.macro.mall.dto.PmsProductResult;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.service.PmsProductService;
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
 * 商品管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "PmsProductController", description = "商品管理")
@RequestMapping("/product")
public class PmsProductController {

    private final PmsProductService productService;

    @ApiOperation("创建商品")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final PmsProductParam productParam) {
        final int count = productService.create(productParam);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("根据商品id获取商品编辑信息")
    @GetMapping(value = "/updateInfo/{id}")
    @ResponseBody
    public CommonResult<PmsProductResult> getUpdateInfo(@PathVariable final Long id) {
        PmsProductResult productResult = productService.getUpdateInfo(id);
        return CommonResult.success(productResult);
    }

    @ApiOperation("更新商品")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final PmsProductParam productParam) {
        final int count = productService.update(id, productParam);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("查询商品")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<PmsProduct>> getList(
            final PmsProductQueryParam productQueryParam,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<PmsProduct> productList = productService.list(productQueryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(productList));
    }

    @ApiOperation("根据商品名称或货号模糊查询")
    @GetMapping(value = "/simpleList")
    @ResponseBody
    public CommonResult<List<PmsProduct>> getList(final String keyword) {
        final List<PmsProduct> productList = productService.list(keyword);
        return CommonResult.success(productList);
    }

    @ApiOperation("批量修改审核状态")
    @PostMapping(value = "/update/verifyStatus")
    @ResponseBody
    public CommonResult<?> updateVerifyStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam("verifyStatus") final Integer verifyStatus,
            @RequestParam("detail") final String detail) {
        final int count = productService.updateVerifyStatus(ids, verifyStatus, detail);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量上下架")
    @PostMapping(value = "/update/publishStatus")
    @ResponseBody
    public CommonResult<?> updatePublishStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam("publishStatus") final Integer publishStatus) {
        final int count = productService.updatePublishStatus(ids, publishStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量推荐商品")
    @PostMapping(value = "/update/recommendStatus")
    @ResponseBody
    public CommonResult<?> updateRecommendStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam("recommendStatus") final Integer recommendStatus) {
        final int count = productService.updateRecommendStatus(ids, recommendStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量设为新品")
    @PostMapping(value = "/update/newStatus")
    @ResponseBody
    public CommonResult<?> updateNewStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam("newStatus") final Integer newStatus) {
        final int count = productService.updateNewStatus(ids, newStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量修改删除状态")
    @PostMapping(value = "/update/deleteStatus")
    @ResponseBody
    public CommonResult<?> updateDeleteStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam("deleteStatus") final Integer deleteStatus) {
        final int count = productService.updateDeleteStatus(ids, deleteStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
