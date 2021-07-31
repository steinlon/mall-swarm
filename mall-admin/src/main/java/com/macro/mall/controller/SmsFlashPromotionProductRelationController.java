package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.SmsFlashPromotionProduct;
import com.macro.mall.model.SmsFlashPromotionProductRelation;
import com.macro.mall.service.SmsFlashPromotionProductRelationService;
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
 * 限时购和商品关系管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "SmsFlashPromotionProductRelationController", description = "限时购和商品关系管理")
@RequestMapping("/flashProductRelation")
public class SmsFlashPromotionProductRelationController {

    private final SmsFlashPromotionProductRelationService relationService;

    @ApiOperation("批量选择商品添加关联")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final List<SmsFlashPromotionProductRelation> relationList) {
        final int count = relationService.create(relationList);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改关联相关信息")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final SmsFlashPromotionProductRelation relation) {
        final int count = relationService.update(id, relation);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("删除关联")
    @PostMapping(value = "/delete/{id}")
    @ResponseBody
    public CommonResult<?> delete(@PathVariable final Long id) {
        final int count = relationService.delete(id);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取管理商品促销信息")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<SmsFlashPromotionProductRelation> getItem(@PathVariable final Long id) {
        final SmsFlashPromotionProductRelation relation = relationService.getItem(id);
        return CommonResult.success(relation);
    }

    @ApiOperation("分页查询不同场次关联及商品信息")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<SmsFlashPromotionProduct>> list(
            @RequestParam(value = "flashPromotionId") final Long flashPromotionId,
            @RequestParam(value = "flashPromotionSessionId") final Long flashPromotionSessionId,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<SmsFlashPromotionProduct> flashPromotionProductList =
                relationService.list(flashPromotionId, flashPromotionSessionId, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(flashPromotionProductList));
    }
}
