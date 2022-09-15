package com.macro.mall.demo.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.service.FeignSearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Feign调用mall-search接口示例
 */
@Api(tags = "FeignSearchController", description = "Feign调用mall-search接口示例")
@RestController
@RequestMapping("/feign/search")
@AllArgsConstructor
public class FeignSearchController {

    private final FeignSearchService feignSearchService;

    @ApiOperation(value = "简单商品搜索")
    @RequestMapping(value = "/justSearch", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<?> search(
            @RequestParam(required = false) final String keyword,
            @RequestParam(required = false, defaultValue = "0") final Integer pageNum,
            @RequestParam(required = false, defaultValue = "5") final Integer pageSize) {
        return feignSearchService.search(keyword, pageNum, pageSize);
    }
}
