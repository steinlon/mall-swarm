package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.SmsFlashPromotion;
import com.macro.mall.service.SmsFlashPromotionService;
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
 * 限时购活动管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "SmsFlashPromotionController", description = "限时购活动管理")
@RequestMapping("/flash")
public class SmsFlashPromotionController {

    private final SmsFlashPromotionService flashPromotionService;

    @ApiOperation("添加活动")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final SmsFlashPromotion flashPromotion) {
        final int count = flashPromotionService.create(flashPromotion);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("编辑活动信息")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public Object update(
            @PathVariable final Long id,
            @RequestBody final SmsFlashPromotion flashPromotion) {
        final int count = flashPromotionService.update(id, flashPromotion);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("删除活动信息")
    @PostMapping(value = "/delete/{id}")
    @ResponseBody
    public Object delete(@PathVariable final Long id) {
        final int count = flashPromotionService.delete(id);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改上下线状态")
    @PostMapping(value = "/update/status/{id}")
    @ResponseBody
    public Object update(
            @PathVariable final Long id,
            @RequestParam(value = "status") final Integer status) {
        final int count = flashPromotionService.updateStatus(id, status);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取活动详情")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public Object getItem(@PathVariable Long id) {
        final SmsFlashPromotion flashPromotion = flashPromotionService.getItem(id);
        return CommonResult.success(flashPromotion);
    }

    @ApiOperation("根据活动名称分页查询")
    @GetMapping(value = "/list")
    @ResponseBody
    public Object getItem(
            @RequestParam(value = "keyword", required = false) final String keyword,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<SmsFlashPromotion> flashPromotionList = flashPromotionService.list(keyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(flashPromotionList));
    }
}
