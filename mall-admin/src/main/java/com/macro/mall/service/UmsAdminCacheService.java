package com.macro.mall.service;

import com.macro.mall.model.UmsAdmin;

import java.util.Date;

/**
 * 后台用户缓存操作类
 */
public interface UmsAdminCacheService {
    /**
     * 删除后台用户缓存已经登出系统
     */
    void delAdmin(Long adminId);

    /**
     * 获取缓存后台用户信息
     */
    UmsAdmin getAdmin(Long adminId);

    /**
     * 设置缓存后台用户信息
     */
    void setAdmin(UmsAdmin admin, Date expire);
}
