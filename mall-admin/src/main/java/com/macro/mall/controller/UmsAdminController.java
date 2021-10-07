package com.macro.mall.controller;

import cn.hutool.core.collection.CollUtil;
import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.domain.UserDto;
import com.macro.mall.dto.UmsAdminLoginParam;
import com.macro.mall.dto.UmsAdminParam;
import com.macro.mall.dto.UpdateAdminPasswordParam;
import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsRole;
import com.macro.mall.service.UmsAdminService;
import com.macro.mall.service.UmsRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 后台用户管理
 */
@Controller
@AllArgsConstructor
@Api(tags = "UmsAdminController", description = "后台用户管理")
@RequestMapping("/admin")
public class UmsAdminController {

    private final UmsAdminService adminService;
    private final UmsRoleService roleService;

    @ApiOperation(value = "用户注册")
    @PostMapping(value = "/register")
    @ResponseBody
    public CommonResult<UmsAdmin> register(@Validated @RequestBody final UmsAdminParam umsAdminParam) {
        final UmsAdmin umsAdmin = adminService.register(umsAdminParam);
        return umsAdmin == null ? CommonResult.failed() : CommonResult.success(umsAdmin);
    }

    @ApiOperation(value = "登录以后返回token")
    @PostMapping(value = "/login")
    @ResponseBody
    public CommonResult<?> login(@Validated @RequestBody final UmsAdminLoginParam umsAdminLoginParam) {
        return adminService.login(umsAdminLoginParam.getUsername(), umsAdminLoginParam.getPassword());
    }

    @ApiOperation(value = "获取当前登录用户信息")
    @GetMapping(value = "/info")
    @ResponseBody
    public CommonResult<?> getAdminInfo() {
        final UmsAdmin umsAdmin = adminService.getCurrentAdmin();
        final Map<String, Object> data = new HashMap<>(4);
        data.put("username", umsAdmin.getUsername());
        data.put("menus", roleService.getMenuList(umsAdmin.getId()));
        data.put("icon", umsAdmin.getIcon());
        final List<UmsRole> roleList = adminService.getRoleList(umsAdmin.getId());
        if (CollUtil.isNotEmpty(roleList)) {
            final List<String> roles = roleList.stream()
                    .map(UmsRole::getName)
                    .collect(Collectors.toList());
            data.put("roles", roles);
        }
        return CommonResult.success(data);
    }

    @ApiOperation(value = "登出功能")
    @PostMapping(value = "/logout")
    @ResponseBody
    public CommonResult<?> logout() {
        adminService.logout();
        return CommonResult.success(null);
    }

    @ApiOperation("根据用户名或姓名分页获取用户列表")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<UmsAdmin>> list(
            @RequestParam(value = "keyword", required = false) final String keyword,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<UmsAdmin> adminList = adminService.list(keyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(adminList));
    }

    @ApiOperation("获取指定用户信息")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<UmsAdmin> getItem(@PathVariable final Long id) {
        final UmsAdmin admin = adminService.getItem(id);
        return CommonResult.success(admin);
    }

    @ApiOperation("修改指定用户信息")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(@PathVariable final Long id, @RequestBody final UmsAdmin admin) {
        final int count = adminService.update(id, admin);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改指定用户密码")
    @PostMapping(value = "/updatePassword")
    @ResponseBody
    public CommonResult<?> updatePassword(@RequestBody final UpdateAdminPasswordParam updatePasswordParam) {
        final int status = adminService.updatePassword(updatePasswordParam);
        if (status > 0) {
            return CommonResult.success(status);
        } else if (status == -1) {
            return CommonResult.failed("提交参数不合法");
        } else if (status == -2) {
            return CommonResult.failed("找不到该用户");
        } else if (status == -3) {
            return CommonResult.failed("旧密码错误");
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("删除指定用户信息")
    @PostMapping(value = "/delete/{id}")
    @ResponseBody
    public CommonResult<?> delete(@PathVariable final Long id) {
        final int count = adminService.delete(id);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改帐号状态")
    @PostMapping(value = "/updateStatus/{id}")
    @ResponseBody
    public CommonResult<?> updateStatus(
            @PathVariable final Long id,
            @RequestParam(value = "status") final Integer status) {
        final UmsAdmin umsAdmin = new UmsAdmin();
        umsAdmin.setStatus(status);
        final int count = adminService.update(id, umsAdmin);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("给用户分配角色")
    @PostMapping(value = "/role/update")
    @ResponseBody
    public CommonResult<?> updateRole(
            @RequestParam("adminId") final Long adminId,
            @RequestParam("roleIds") final List<Long> roleIds) {
        final int count = adminService.updateRole(adminId, roleIds);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取指定用户的角色")
    @GetMapping(value = "/role/{adminId}")
    @ResponseBody
    public CommonResult<List<UmsRole>> getRoleList(@PathVariable final Long adminId) {
        final List<UmsRole> roleList = adminService.getRoleList(adminId);
        return CommonResult.success(roleList);
    }

    @ApiOperation("根据用户名获取通用用户信息")
    @GetMapping(value = "/loadByUsername")
    @ResponseBody
    public UserDto loadUserByUsername(@RequestParam final String username) {
        return adminService.loadUserByUsername(username);
    }
}
