package com.macro.mall.controller;


import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.OssCallbackResult;
import com.macro.mall.dto.OssPolicyResult;
import com.macro.mall.service.impl.OssServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Oss相关操作接口
 */
@Controller
@AllArgsConstructor
@Api(tags = "OssController", description = "Oss管理")
@RequestMapping("/aliyun/oss")
public class OssController {

    private final OssServiceImpl ossService;

    @ApiOperation(value = "oss上传签名生成")
    @GetMapping(value = "/policy")
    @ResponseBody
    public CommonResult<OssPolicyResult> policy() {
        final OssPolicyResult result = ossService.policy();
        return CommonResult.success(result);
    }

    @ApiOperation(value = "oss上传成功回调")
    @PostMapping(value = "callback")
    @ResponseBody
    public CommonResult<OssCallbackResult> callback(final HttpServletRequest request) {
        final OssCallbackResult ossCallbackResult = ossService.callback(request);
        return CommonResult.success(ossCallbackResult);
    }

}
