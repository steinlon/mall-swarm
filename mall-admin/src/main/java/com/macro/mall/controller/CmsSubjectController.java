package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.CmsSubject;
import com.macro.mall.service.CmsSubjectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 商品专题管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "CmsSubjectController", description = "商品专题管理")
@RequestMapping("/subject")
public class CmsSubjectController {

    private final CmsSubjectService subjectService;

    @ApiOperation("获取全部商品专题")
    @GetMapping(value = "/listAll")
    @ResponseBody
    public CommonResult<List<CmsSubject>> listAll() {
        final List<CmsSubject> subjectList = subjectService.listAll();
        return CommonResult.success(subjectList);
    }

    @ApiOperation(value = "根据专题名称分页获取专题")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<CmsSubject>> getList(
            @RequestParam(value = "keyword", required = false) final String keyword,
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        final List<CmsSubject> subjectList = subjectService.list(keyword, pageNum, pageSize);
        return CommonResult.success(CommonPage.restPage(subjectList));
    }
}
