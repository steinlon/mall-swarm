package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsMemberLevel;
import com.macro.mall.service.UmsMemberLevelService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static com.macro.mall.common.constant.UrlConstant.MEMBER_LEVEL;

/**
 * 会员等级管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "UmsMemberLevelController", description = "会员等级管理")
@RequestMapping(MEMBER_LEVEL)
public class UmsMemberLevelController {

    private final UmsMemberLevelService memberLevelService;

    @GetMapping(value = "/list")
    @ApiOperation("查询所有会员等级")
    @ResponseBody
    public CommonResult<List<UmsMemberLevel>> list(@RequestParam("defaultStatus") final Integer defaultStatus) {
        final List<UmsMemberLevel> memberLevelList = memberLevelService.list(defaultStatus);
        return CommonResult.success(memberLevelList);
    }
}
