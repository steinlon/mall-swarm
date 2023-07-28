package com.macro.mall.component;

import com.macro.mall.service.UmsResourceService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * 资源与角色访问对应关系操作组件
 */
@Component
@AllArgsConstructor
public class ResourceRoleRulesHolder {

    private final UmsResourceService resourceService;

    @PostConstruct
    public void initResourceRolesMap() {
        resourceService.initResourceRolesMap();
    }
}
