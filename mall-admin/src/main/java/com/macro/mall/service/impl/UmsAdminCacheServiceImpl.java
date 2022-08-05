package com.macro.mall.service.impl;

import com.macro.mall.common.service.RedisService;
import com.macro.mall.model.UmsAdmin;
import com.macro.mall.service.UmsAdminCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * UmsAdminCacheService实现类
 */
@Service
public class UmsAdminCacheServiceImpl implements UmsAdminCacheService {

    private final RedisService redisService;
    private final String redisDataBase;
    private final String redisKeyAdmin;

    @Autowired
    public UmsAdminCacheServiceImpl(
            final RedisService redisService,
            @Value("${redis.database}") final String redisDataBase,
            @Value("${redis.key.admin}") final String redisKeyAdmin) {
        this.redisService = redisService;
        this.redisDataBase = redisDataBase;
        this.redisKeyAdmin = redisKeyAdmin;
    }

    @Override
    public void delAdmin(final Long adminId) {
        final String key = redisDataBase + ":" + redisKeyAdmin + ":" + adminId;
        redisService.del(key);
    }

    @Override
    public UmsAdmin getAdmin(final Long adminId) {
        final String key = redisDataBase + ":" + redisKeyAdmin + ":" + adminId;
        return (UmsAdmin) redisService.get(key);
    }

    @Override
    public void setAdmin(final UmsAdmin admin) {
        final String key = redisDataBase + ":" + redisKeyAdmin + ":" + admin.getId();
        redisService.set(key, admin);
//        redisService.expireAt(key, expire);
    }
}
