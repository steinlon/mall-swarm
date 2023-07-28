package com.macro.mall.portal.service.impl;

import com.macro.mall.common.annotation.CacheException;
import com.macro.mall.common.service.RedisService;
import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.service.UmsMemberCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * UmsMemberCacheService实现类
 */
@Service
public class UmsMemberCacheServiceImpl implements UmsMemberCacheService {

    private final RedisService redisService;
    private final String REDIS_DATABASE;
    private final Long REDIS_EXPIRE;
    private final Long REDIS_EXPIRE_AUTH_CODE;
    private final String REDIS_KEY_MEMBER;
    private final String REDIS_KEY_AUTH_CODE;

    @Autowired
    public UmsMemberCacheServiceImpl(
            final RedisService redisService,
            @Value("${redis.database}") final String redisDatabase,
            @Value("${redis.expire.common}") final Long redisExpire,
            @Value("${redis.expire.authCode}") final Long redisExpireAuthCode,
            @Value("${redis.key.member}") final String redisKeyMember,
            @Value("${redis.key.authCode}") final String redisKeyAuthCode) {
        this.redisService = redisService;
        this.REDIS_DATABASE = redisDatabase;
        this.REDIS_EXPIRE = redisExpire;
        this.REDIS_EXPIRE_AUTH_CODE = redisExpireAuthCode;
        this.REDIS_KEY_MEMBER = redisKeyMember;
        this.REDIS_KEY_AUTH_CODE = redisKeyAuthCode;
    }

    @Override
    public void delMember(final Long memberId) {
        final String key = REDIS_DATABASE + ":" + REDIS_KEY_MEMBER + ":" + memberId;
        redisService.del(key);
    }

    @Override
    public UmsMember getMember(final Long memberId) {
        final String key = REDIS_DATABASE + ":" + REDIS_KEY_MEMBER + ":" + memberId;
        return (UmsMember) redisService.get(key);
    }

    @Override
    public void setMember(final UmsMember member) {
        final String key = REDIS_DATABASE + ":" + REDIS_KEY_MEMBER + ":" + member.getId();
        redisService.set(key, member, REDIS_EXPIRE);
    }

    @CacheException
    @Override
    public void setAuthCode(final String telephone, final String authCode) {
        final String key = REDIS_DATABASE + ":" + REDIS_KEY_AUTH_CODE + ":" + telephone;
        redisService.set(key, authCode, REDIS_EXPIRE_AUTH_CODE);
    }

    @CacheException
    @Override
    public String getAuthCode(final String telephone) {
        final String key = REDIS_DATABASE + ":" + REDIS_KEY_AUTH_CODE + ":" + telephone;
        return (String) redisService.get(key);
    }
}
