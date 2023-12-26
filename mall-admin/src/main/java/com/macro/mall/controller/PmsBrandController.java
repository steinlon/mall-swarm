package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.PmsBrandParam;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.service.PmsBrandService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 品牌功能Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "PmsBrandController", description = "商品品牌管理")
@RequestMapping("/brand")
public class PmsBrandController {

    private final PmsBrandService brandService;

    @ApiOperation(value = "获取全部品牌列表")
    @GetMapping(value = "/listAll")
    @ResponseBody
    public CommonResult<List<PmsBrand>> getList() {
        return CommonResult.success(brandService.listAllBrand());
    }

    @ApiOperation(value = "添加品牌")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@Validated @RequestBody final PmsBrandParam pmsBrand) {
        final int count = brandService.createBrand(pmsBrand);
        return count == 1 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation(value = "更新品牌")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable("id") final Long id,
            @Validated @RequestBody final PmsBrandParam pmsBrandParam) {
        final int count = brandService.updateBrand(id, pmsBrandParam);
        return count == 1 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation(value = "删除品牌")
    @GetMapping(value = "/delete/{id}")
    @ResponseBody
    public CommonResult<?> delete(@PathVariable("id") final Long id) {
        final int count = brandService.deleteBrand(id);
        return count == 1 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation(value = "根据品牌名称分页获取品牌列表")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<PmsBrand>> getList(
            @RequestParam(value = "keyword", required = false) final String keyword,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize) {
        final List<PmsBrand> brandList = brandService.listBrand(keyword, pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(brandList));
    }

    @ApiOperation(value = "根据编号查询品牌信息")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<PmsBrand> getItem(@PathVariable("id") final Long id) {
        return CommonResult.success(brandService.getBrand(id));
    }

    @ApiOperation(value = "批量删除品牌")
    @PostMapping(value = "/delete/batch")
    @ResponseBody
    public CommonResult<?> deleteBatch(@RequestParam("ids") final List<Long> ids) {
        final int count = brandService.deleteBrand(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation(value = "批量更新显示状态")
    @PostMapping(value = "/update/showStatus")
    @ResponseBody
    public CommonResult<?> updateShowStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam("showStatus") final Integer showStatus) {
        final int count = brandService.updateShowStatus(ids, showStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation(value = "批量更新厂家制造商状态")
    @PostMapping(value = "/update/factoryStatus")
    @ResponseBody
    public CommonResult<?> updateFactoryStatus(@RequestParam("ids") final List<Long> ids,
            @RequestParam("factoryStatus") Integer factoryStatus) {
        final int count = brandService.updateFactoryStatus(ids, factoryStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
