package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.SmsHomeBrand;
import com.macro.mall.service.SmsHomeBrandService;
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
 * 首页品牌管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "SmsHomeBrandController", description = "首页品牌管理")
@RequestMapping("/home/brand")
public class SmsHomeBrandController {

    private final SmsHomeBrandService homeBrandService;

    @ApiOperation("添加首页推荐品牌")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final List<SmsHomeBrand> homeBrandList) {
        final int count = homeBrandService.create(homeBrandList);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改品牌排序")
    @PostMapping(value = "/update/sort/{id}")
    @ResponseBody
    public CommonResult<?> updateSort(@PathVariable final Long id, final Integer sort) {
        final int count = homeBrandService.updateSort(id, sort);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量删除推荐品牌")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<Long> ids) {
        final int count = homeBrandService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量修改推荐状态")
    @PostMapping(value = "/update/recommendStatus")
    @ResponseBody
    public CommonResult<?> updateRecommendStatus(
            @RequestParam("ids") final List<Long> ids,
            @RequestParam final Integer recommendStatus) {
        final int count = homeBrandService.updateRecommendStatus(ids, recommendStatus);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("分页查询推荐品牌")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<SmsHomeBrand>> list(
            @RequestParam(value = "brandName", required = false) final String brandName,
            @RequestParam(value = "recommendStatus", required = false) final Integer recommendStatus,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        List<SmsHomeBrand> homeBrandList = homeBrandService.list(brandName, recommendStatus, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(homeBrandList));
    }
}
