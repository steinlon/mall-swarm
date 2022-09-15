package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.portal.domain.MemberReadHistory;
import com.macro.mall.portal.service.MemberReadHistoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 会员商品浏览记录管理Controller
 */
@AllArgsConstructor
@Controller
@Api(tags = "MemberReadHistoryController", description = "会员商品浏览记录管理")
@RequestMapping("/member/readHistory")
public class MemberReadHistoryController {

    private final MemberReadHistoryService memberReadHistoryService;

    @ApiOperation("创建浏览记录")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<?> create(@RequestBody final MemberReadHistory memberReadHistory) {
        final int count = memberReadHistoryService.create(memberReadHistory);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("删除浏览记录")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<String> ids) {
        final int count = memberReadHistoryService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("清空除浏览记录")
    @RequestMapping(value = "/clear", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<?> clear() {
        memberReadHistoryService.clear();
        return CommonResult.success(null);
    }

    @ApiOperation("分页获取用户浏览记录")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<MemberReadHistory>> list(
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize) {
        final Page<MemberReadHistory> page = memberReadHistoryService.list(pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(page));
    }
}
