package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.CmsPreferenceArea;
import com.macro.mall.service.CmsPreferenceAreaService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商品优选管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "CmsPreferenceAreaController", description = "商品优选管理")
@RequestMapping("/preferenceArea")
public class CmsPreferenceAreaController {

    private final CmsPreferenceAreaService preferenceAreaService;

    @ApiOperation("获取所有商品优选")
    @GetMapping(value = "/listAll")
    @ResponseBody
    public CommonResult<List<CmsPreferenceArea>> listAll() {
        final List<CmsPreferenceArea> preferenceAreaList = preferenceAreaService.listAll();
        return CommonResult.success(preferenceAreaList);
    }
}
