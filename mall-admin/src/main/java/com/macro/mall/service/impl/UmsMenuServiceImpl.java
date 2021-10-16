package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.dto.UmsMenuNode;
import com.macro.mall.mapper.UmsMenuMapper;
import com.macro.mall.model.UmsMenu;
import com.macro.mall.model.UmsMenuExample;
import com.macro.mall.service.UmsMenuService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 后台菜单管理Service实现类
 */
@AllArgsConstructor
@Service
public class UmsMenuServiceImpl implements UmsMenuService {

    private final UmsMenuMapper menuMapper;

    @Override
    public int create(final UmsMenu umsMenu) {
        umsMenu.setCreateTime(new Date());
        updateLevel(umsMenu);
        return menuMapper.insert(umsMenu);
    }

    /**
     * 修改菜单层级
     */
    private void updateLevel(final UmsMenu umsMenu) {
        if (umsMenu.getParentId() == 0) {
            //没有父菜单时为一级菜单
            umsMenu.setLevel(0);
        } else {
            //有父菜单时选择根据父菜单level设置
            final UmsMenu parentMenu = menuMapper.selectByPrimaryKey(umsMenu.getParentId());
            if (parentMenu != null) {
                umsMenu.setLevel(parentMenu.getLevel() + 1);
            } else {
                umsMenu.setLevel(0);
            }
        }
    }

    @Override
    public int update(final Long id, final UmsMenu umsMenu) {
        umsMenu.setId(id);
        updateLevel(umsMenu);
        return menuMapper.updateByPrimaryKeySelective(umsMenu);
    }

    @Override
    public UmsMenu getItem(final Long id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int delete(final Long id) {
        return menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<UmsMenu> list(final Long parentId, final Integer pageSize, final Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        final UmsMenuExample example = new UmsMenuExample();
        example.setOrderByClause("sort desc");
        example.createCriteria().andParentIdEqualTo(parentId);
        return menuMapper.selectByExample(example);
    }

    @Override
    public List<UmsMenuNode> treeList() {
        final List<UmsMenu> menuList = menuMapper.selectByExample(new UmsMenuExample());
        return menuList.stream()
                .filter(menu -> menu.getParentId().equals(0L))
                .map(menu -> covertMenuNode(menu, menuList))
                .collect(Collectors.toList());
    }

    @Override
    public int updateHidden(final Long id, final Integer hidden) {
        final UmsMenu umsMenu = new UmsMenu();
        umsMenu.setId(id);
        umsMenu.setHidden(hidden);
        return menuMapper.updateByPrimaryKeySelective(umsMenu);
    }

    /**
     * 将UmsMenu转化为UmsMenuNode并设置children属性
     */
    private UmsMenuNode covertMenuNode(final UmsMenu menu, final List<UmsMenu> menuList) {
        final UmsMenuNode node = new UmsMenuNode();
        BeanUtils.copyProperties(menu, node);
        final List<UmsMenuNode> children = menuList.stream()
                .filter(subMenu -> subMenu.getParentId().equals(menu.getId()))
                .map(subMenu -> covertMenuNode(subMenu, menuList)).collect(Collectors.toList());
        node.setChildren(children);
        return node;
    }
}
