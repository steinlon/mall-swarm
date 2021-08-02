package com.macro.mall.service.impl;

import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.common.constant.AuthConstant;
import com.macro.mall.common.service.RedisService;
import com.macro.mall.mapper.UmsResourceMapper;
import com.macro.mall.mapper.UmsRoleMapper;
import com.macro.mall.mapper.UmsRoleResourceRelationMapper;
import com.macro.mall.model.UmsResource;
import com.macro.mall.model.UmsResourceExample;
import com.macro.mall.model.UmsRole;
import com.macro.mall.model.UmsRoleExample;
import com.macro.mall.model.UmsRoleResourceRelation;
import com.macro.mall.model.UmsRoleResourceRelationExample;
import com.macro.mall.service.UmsResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collectors;

/**
 * 后台资源管理Service实现类
 */
@Service
public class UmsResourceServiceImpl implements UmsResourceService {

    private final UmsResourceMapper resourceMapper;
    private final UmsRoleMapper roleMapper;
    private final UmsRoleResourceRelationMapper roleResourceRelationMapper;
    private final RedisService redisService;
    private final String applicationName;

    @Autowired
    public UmsResourceServiceImpl(
            final UmsResourceMapper resourceMapper,
            final UmsRoleMapper roleMapper,
            final UmsRoleResourceRelationMapper roleResourceRelationMapper,
            final RedisService redisService,
            @Value("${spring.application.name}") final String applicationName) {
        this.resourceMapper = resourceMapper;
        this.roleMapper = roleMapper;
        this.roleResourceRelationMapper = roleResourceRelationMapper;
        this.redisService = redisService;
        this.applicationName = applicationName;
    }

    @Override
    public int create(final UmsResource umsResource) {
        umsResource.setCreateTime(new Date());
        final int count = resourceMapper.insert(umsResource);
        initResourceRolesMap();
        return count;
    }

    @Override
    public int update(final Long id, final UmsResource umsResource) {
        umsResource.setId(id);
        final int count = resourceMapper.updateByPrimaryKeySelective(umsResource);
        initResourceRolesMap();
        return count;
    }

    @Override
    public UmsResource getItem(final Long id) {
        return resourceMapper.selectByPrimaryKey(id);
    }

    @Override
    public int delete(final Long id) {
        final int count = resourceMapper.deleteByPrimaryKey(id);
        initResourceRolesMap();
        return count;
    }

    @Override
    public List<UmsResource> list(
            final Long categoryId,
            final String nameKeyword,
            final String urlKeyword,
            final Integer pageSize,
            final Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        final UmsResourceExample example = new UmsResourceExample();
        final UmsResourceExample.Criteria criteria = example.createCriteria();
        if (categoryId != null) {
            criteria.andCategoryIdEqualTo(categoryId);
        }
        if (StrUtil.isNotEmpty(nameKeyword)) {
            criteria.andNameLike('%' + nameKeyword + '%');
        }
        if (StrUtil.isNotEmpty(urlKeyword)) {
            criteria.andUrlLike('%' + urlKeyword + '%');
        }
        return resourceMapper.selectByExample(example);
    }

    @Override
    public List<UmsResource> listAll() {
        return resourceMapper.selectByExample(new UmsResourceExample());
    }

    @Override
    public Map<String, List<String>> initResourceRolesMap() {
        final Map<String, List<String>> resourceRoleMap = new TreeMap<>();
        final List<UmsResource> resourceList = resourceMapper.selectByExample(new UmsResourceExample());
        final List<UmsRole> roleList = roleMapper.selectByExample(new UmsRoleExample());
        final List<UmsRoleResourceRelation> relationList = roleResourceRelationMapper.selectByExample(new UmsRoleResourceRelationExample());
        for (UmsResource resource : resourceList) {
            final Set<Long> roleIds = relationList
                    .stream()
                    .filter(item -> item.getResourceId().equals(resource.getId()))
                    .map(UmsRoleResourceRelation::getRoleId)
                    .collect(Collectors.toSet());
            List<String> roleNames = roleList
                    .stream()
                    .filter(item -> roleIds.contains(item.getId()))
                    .map(item -> item.getId() + "_" + item.getName())
                    .collect(Collectors.toList());
            resourceRoleMap.put("/" + applicationName + resource.getUrl(), roleNames);
        }
        redisService.del(AuthConstant.RESOURCE_ROLES_MAP_KEY);
        redisService.hSetAll(AuthConstant.RESOURCE_ROLES_MAP_KEY, resourceRoleMap);
        return resourceRoleMap;

    }
}
