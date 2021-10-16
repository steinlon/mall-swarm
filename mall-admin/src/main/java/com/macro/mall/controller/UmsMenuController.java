package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.dto.UmsMenuNode;
import com.macro.mall.model.UmsMenu;
import com.macro.mall.service.UmsMenuService;
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

import static com.macro.mall.constant.UrlConstant.MENU;

/**
 * 后台菜单管理Controller
 */
@Controller
@AllArgsConstructor
@Api(tags = "UmsMenuController", value = "后台菜单管理")
@RequestMapping(MENU)
public class UmsMenuController {

    private final UmsMenuService menuService;

    @ApiOperation("添加后台菜单")
    @PostMapping(value = "/create")
    @ResponseBody
    public CommonResult<?> create(@RequestBody final UmsMenu umsMenu) {
        final int count = menuService.create(umsMenu);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("修改后台菜单")
    @PostMapping(value = "/update/{id}")
    @ResponseBody
    public CommonResult<?> update(
            @PathVariable final Long id,
            @RequestBody final UmsMenu umsMenu) {
        final int count = menuService.update(id, umsMenu);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("根据ID获取菜单详情")
    @GetMapping(value = "/{id}")
    @ResponseBody
    public CommonResult<UmsMenu> getItem(@PathVariable final Long id) {
        final UmsMenu umsMenu = menuService.getItem(id);
        return CommonResult.success(umsMenu);
    }

    @ApiOperation("根据ID删除后台菜单")
    @PostMapping(value = "/delete/{id}")
    @ResponseBody
    public CommonResult<?> delete(@PathVariable final Long id) {
        final int count = menuService.delete(id);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }

    @ApiOperation("分页查询后台菜单")
    @GetMapping(value = "/list/{parentId}")
    @ResponseBody
    public CommonResult<CommonPage<UmsMenu>> list(
            @PathVariable final Long parentId,
            @RequestParam(value = "pageSize", defaultValue = "5") final Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") final Integer pageNum) {
        final List<UmsMenu> menuList = menuService.list(parentId, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(menuList));
    }

    @ApiOperation("树形结构返回所有菜单列表")
    @GetMapping(value = "/treeList")
    @ResponseBody
    public CommonResult<List<UmsMenuNode>> treeList() {
        final List<UmsMenuNode> list = menuService.treeList();
        return CommonResult.success(list);
    }

    @ApiOperation("修改菜单显示状态")
    @PostMapping(value = "/updateHidden/{id}")
    @ResponseBody
    public CommonResult<?> updateHidden(
            @PathVariable final Long id,
            @RequestParam("hidden") final Integer hidden) {
        final int count = menuService.updateHidden(id, hidden);
        return count > 0 ? CommonResult.success(count) : CommonResult.failed();
    }
}
