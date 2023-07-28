package com.macro.mall.demo.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.dto.PmsBrandDto;
import com.macro.mall.demo.service.DemoService;
import com.macro.mall.model.PmsBrand;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商品管理示例Controller
 */
@Api(tags = "DemoController", description = "商品管理示例接口")
@Controller
@AllArgsConstructor
@Slf4j
public class DemoController {

    private final DemoService demoService;

    @ApiOperation(value = "获取全部品牌列表")
    @GetMapping(value = "/brand/listAll")
    @ResponseBody
    public CommonResult<List<PmsBrand>> getBrandList() {
        return CommonResult.success(demoService.listAllBrand());
    }

    @ApiOperation(value = "添加品牌")
    @PostMapping(value = "/brand/create")
    @ResponseBody
    public CommonResult<?> createBrand(@Validated @RequestBody final PmsBrandDto pmsBrand) {
        CommonResult<?> commonResult;
        final int count = demoService.createBrand(pmsBrand);
        if (count == 1) {
            log.debug("createBrand success:{}", pmsBrand);
            commonResult = CommonResult.success(pmsBrand);
        } else {
            log.debug("createBrand failed:{}", pmsBrand);
            commonResult = CommonResult.failed("操作失败");
        }
        return commonResult;
    }

    @ApiOperation(value = "更新品牌")
    @PostMapping(value = "/brand/update/{id}")
    @ResponseBody
    public CommonResult<?> updateBrand(
            @PathVariable("id") final Long id,
            @Validated @RequestBody final PmsBrandDto pmsBrandDto) {
        CommonResult<?> commonResult;
        final int count = demoService.updateBrand(id, pmsBrandDto);
        if (count == 1) {
            log.debug("updateBrand success:{}", pmsBrandDto);
            commonResult = CommonResult.success(pmsBrandDto);
        } else {
            log.debug("updateBrand failed:{}", pmsBrandDto);
            commonResult = CommonResult.failed("操作失败");
        }
        return commonResult;
    }

    @ApiOperation(value = "删除品牌")
    @GetMapping(value = "/brand/delete/{id}")
    @ResponseBody
    public CommonResult<?> deleteBrand(@PathVariable("id") final Long id) {
        final int count = demoService.deleteBrand(id);
        if (count == 1) {
            log.debug("deleteBrand success :id={}", id);
            return CommonResult.success(null);
        } else {
            log.debug("deleteBrand failed :id={}", id);
            return CommonResult.failed("操作失败");
        }
    }

    @ApiOperation(value = "分页获取品牌列表")
    @GetMapping(value = "/brand/list")
    @ResponseBody
    public CommonResult<CommonPage<PmsBrand>> listBrand(
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "3") final Integer pageSize) {
        final List<PmsBrand> brandList = demoService.listBrand(pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(brandList));
    }

    @ApiOperation(value = "根据编号查询品牌信息")
    @GetMapping(value = "/brand/{id}")
    @ResponseBody
    public CommonResult<PmsBrand> brand(@PathVariable("id") final Long id) {
        return CommonResult.success(demoService.getBrand(id));
    }
}
