package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsMenu;
import com.macro.mall.model.UmsResource;
import com.macro.mall.model.UmsRole;
import com.macro.mall.service.UmsRoleService;
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

import static com.macro.mall.constant.UrlConstant.ROLE;

/**
 * 后台用户角色管理
 */
@Controller
@AllArgsConstructor
@Api(tags = "UmsRoleController", description = "后台用户角色管理")
@RequestMapping(ROLE)
public class UmsRoleController {

    private final UmsRoleService roleService;

    @ApiOperation("添加角色")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final UmsRole role) {
        final int count = roleService.create(role);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改角色")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final UmsRole role) {
        final int count = roleService.update(id, role);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("批量删除角色")
    @PostMapping(value = "/delete")
    @ResponseBody
    public CommonResult<?> delete(@RequestParam("ids") final List<Long> ids) {
        final int count = roleService.delete(ids);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取所有角色")
    @GetMapping(value = "/listAll")
    @ResponseBody
    public CommonResult<List<UmsRole>> listAll() {
        final List<UmsRole> roleList = roleService.list();
        return CommonResult.success(roleList);
    }

    @ApiOperation("根据角色名称分页获取角色列表")
    @GetMapping(value = "/list")
    @ResponseBody
    public CommonResult<CommonPage<UmsRole>> list(
            @RequestParam(value = "keyword", required = false) final String keyword,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<UmsRole> roleList = roleService.list(keyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(roleList));
    }

    @ApiOperation("修改角色状态")
    @PostMapping(value = "/updateStatus/{id}")
    @ResponseBody
    public CommonResult<?> updateStatus(
            @PathVariable final Long id,
            @RequestParam(value = "status") final Integer status) {
        final UmsRole umsRole = new UmsRole();
        umsRole.setStatus(status);
        final int count = roleService.update(id, umsRole);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("获取角色相关菜单")
    @GetMapping(value = "/listMenu/{roleId}")
    @ResponseBody
    public CommonResult<List<UmsMenu>> listMenu(@PathVariable final Long roleId) {
        final List<UmsMenu> roleList = roleService.listMenu(roleId);
        return CommonResult.success(roleList);
    }

    @ApiOperation("获取角色相关资源")
    @GetMapping(value = "/listResource/{roleId}")
    @ResponseBody
    public CommonResult<List<UmsResource>> listResource(@PathVariable final Long roleId) {
        final List<UmsResource> roleList = roleService.listResource(roleId);
        return CommonResult.success(roleList);
    }

    @ApiOperation("给角色分配菜单")
    @PostMapping(value = "/allocMenu")
    @ResponseBody
    public CommonResult<?> allocMenu(
            @RequestParam final Long roleId,
            @RequestParam final List<Long> menuIds) {
        final int count = roleService.allocMenu(roleId, menuIds);
        return CommonResult.success(count);
    }

    @ApiOperation("给角色分配资源")
    @PostMapping(value = "/allocResource")
    @ResponseBody
    public CommonResult<?> allocResource(
            @RequestParam final Long roleId,
            @RequestParam final List<Long> resourceIds) {
        final int count = roleService.allocResource(roleId, resourceIds);
        return CommonResult.success(count);
    }

}
