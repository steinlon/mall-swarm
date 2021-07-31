package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsResourceCategory;
import com.macro.mall.service.UmsResourceCategoryService;
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

import java.util.List;

/**
 * 后台资源分类管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "UmsResourceCategoryController", description = "后台资源分类管理")
@RequestMapping("/resourceCategory")
public class UmsResourceCategoryController {

    private final UmsResourceCategoryService resourceCategoryService;

    @ApiOperation("查询所有后台资源分类")
    @GetMapping(value = "/listAll")
    @ResponseBody
    public CommonResult<List<UmsResourceCategory>> listAll() {
        final List<UmsResourceCategory> resourceList = resourceCategoryService.listAll();
        return CommonResult.success(resourceList);
    }

    @ApiOperation("添加后台资源分类")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final UmsResourceCategory umsResourceCategory) {
        final int count = resourceCategoryService.create(umsResourceCategory);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改后台资源分类")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody UmsResourceCategory umsResourceCategory) {
        final int count = resourceCategoryService.update(id, umsResourceCategory);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("根据ID删除后台资源")
    @PostMapping(value = "/delete/{id}")
    @ResponseBody
    public CommonResult<?> delete(@PathVariable final Long id) {
        final int count = resourceCategoryService.delete(id);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
