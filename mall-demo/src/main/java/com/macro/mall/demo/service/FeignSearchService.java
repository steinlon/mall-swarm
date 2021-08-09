package com.macro.mall.demo.service;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.constant.ServiceConstant;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(ServiceConstant.SEARCH_SERVICE)
public interface FeignSearchService {

    @GetMapping("/esProduct/search/simple")
    CommonResult<?> search(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false, defaultValue = "0") Integer pageNum,
            @RequestParam(required = false, defaultValue = "5") Integer pageSize
    );
}
