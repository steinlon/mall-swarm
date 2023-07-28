package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.PmsProductAttributeParam;
import com.macro.mall.dto.ProductAttrInfo;
import com.macro.mall.model.PmsProductAttribute;
import com.macro.mall.service.PmsProductAttributeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
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
 * 商品属性管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "PmsProductAttributeController", description = "商品属性管理")
@RequestMapping("/productAttribute")
public class PmsProductAttributeController {

    private final PmsProductAttributeService productAttributeService;

    @ApiOperation("根据分类查询属性列表或参数列表")
    @ApiImplicitParams({@ApiImplicitParam(name = "type", value = "0表示属性，1表示参数", required = true, paramType = "query", dataType = "integer")})
    @GetMapping(value = "/list/{cid}")
    @ResponseBody
    public CommonResult<CommonPage<PmsProductAttribute>> getList(
            @PathVariable final Long cid,
            @RequestParam(value = "type") final Integer type,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<PmsProductAttribute> productAttributeList = productAttributeService.getList(cid, type, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(productAttributeList));
    }

    @ApiOperation("添加商品属性信息")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final PmsProductAttributeParam productAttributeParam) {
        final int count = productAttributeService.create(productAttributeParam);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改商品属性信息")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final PmsProductAttributeParam productAttributeParam) {
        final int count = productAttributeService.update(id, productAttributeParam);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("查询单个商品属性")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<PmsProductAttribute> getItem(@PathVariable final Long id) {
        final PmsProductAttribute productAttribute = productAttributeService.getItem(id);
        return CommonResult.success(productAttribute);
    }

    @ApiOperation("批量删除商品属性")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<Long> ids) {
        final int count = productAttributeService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("根据商品分类的id获取商品属性及属性分类")
    @GetMapping(value = "/attrInfo/{productCategoryId}")
    @ResponseBody
    public CommonResult<List<ProductAttrInfo>> getAttrInfo(@PathVariable final Long productCategoryId) {
        final List<ProductAttrInfo> productAttrInfoList = productAttributeService.getProductAttrInfo(productCategoryId);
        return CommonResult.success(productAttrInfoList);
    }
}
