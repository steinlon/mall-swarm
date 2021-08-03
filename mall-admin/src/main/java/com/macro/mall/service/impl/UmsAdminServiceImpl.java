package com.macro.mall.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.BCrypt;
import cn.hutool.json.JSONUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.api.IErrorCode;
import com.macro.mall.common.api.ResultCode;
import com.macro.mall.common.constant.AuthConstant;
import com.macro.mall.common.domain.UserDto;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.dao.UmsAdminRoleRelationDao;
import com.macro.mall.dto.UmsAdminParam;
import com.macro.mall.dto.UpdateAdminPasswordParam;
import com.macro.mall.mapper.UmsAdminLoginLogMapper;
import com.macro.mall.mapper.UmsAdminMapper;
import com.macro.mall.mapper.UmsAdminRoleRelationMapper;
import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsAdminExample;
import com.macro.mall.model.UmsAdminLoginLog;
import com.macro.mall.model.UmsAdminRoleRelation;
import com.macro.mall.model.UmsAdminRoleRelationExample;
import com.macro.mall.model.UmsResource;
import com.macro.mall.model.UmsRole;
import com.macro.mall.service.AuthService;
import com.macro.mall.service.UmsAdminCacheService;
import com.macro.mall.service.UmsAdminService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * UmsAdminService实现类
 */
@Service
@AllArgsConstructor
public class UmsAdminServiceImpl implements UmsAdminService {

    private final UmsAdminMapper adminMapper;
    private final UmsAdminRoleRelationMapper adminRoleRelationMapper;
    private final UmsAdminRoleRelationDao adminRoleRelationDao;
    private final UmsAdminLoginLogMapper loginLogMapper;
    private final AuthService authService;
    private final UmsAdminCacheService adminCacheService;
    private final HttpServletRequest request;

    @Override
    public UmsAdmin getAdminByUsername(final String username) {
        final UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(username);
        final List<UmsAdmin> adminList = adminMapper.selectByExample(example);
        if (adminList != null && adminList.size() > 0) {
            return adminList.get(0);
        }
        return null;
    }

    @Override
    public UmsAdmin register(final UmsAdminParam umsAdminParam) {
        final UmsAdmin umsAdmin = new UmsAdmin();
        BeanUtils.copyProperties(umsAdminParam, umsAdmin);
        umsAdmin.setCreateTime(new Date());
        umsAdmin.setStatus(1);
        //查询是否有相同用户名的用户
        final UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(umsAdmin.getUsername());
        final List<UmsAdmin> umsAdminList = adminMapper.selectByExample(example);
        if (umsAdminList.size() > 0) {
            return null;
        }
        //将密码进行加密操作
        final String encodePassword = BCrypt.hashpw(umsAdmin.getPassword());
        umsAdmin.setPassword(encodePassword);
        adminMapper.insert(umsAdmin);
        return umsAdmin;
    }

    @Override
    public CommonResult<?> login(final String username, final String password) {
        if (StrUtil.isEmpty(username) || StrUtil.isEmpty(password)) {
            Asserts.fail("用户名或密码不能为空！");
        }
        final Map<String, String> params = new HashMap<>(5);
        params.put("client_id", AuthConstant.ADMIN_CLIENT_ID);
        params.put("client_secret", "123456");
        params.put("grant_type", "password");
        params.put("username", username);
        params.put("password", password);
        final CommonResult<?> restResult = authService.getAccessToken(params);
        if (ResultCode.SUCCESS == restResult.getErrorCode() && restResult.getData() != null) {
            insertUserLoginLog(username);
        } else {
            updateLoginWithErrorCode(username, restResult.getErrorCode());
        }
        return restResult;
    }

    /**
     * 添加登录记录
     */
    private void insertUserLoginLog(final String username) {
        final UmsAdmin admin = getAdminByUsername(username);
        if (admin == null) {
            return;
        }
        final UmsAdminLoginLog loginLog = new UmsAdminLoginLog();
        loginLog.setAdminId(admin.getId());
        loginLog.setCreateTime(new Date());
        final ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            final HttpServletRequest request = attributes.getRequest();
            loginLog.setIp(request.getRemoteAddr());
        }
        loginLogMapper.insert(loginLog);
    }

    private void updateLoginWithErrorCode(final String username, final IErrorCode errorCode) {
        final UmsAdmin record = new UmsAdmin();
        record.setLoginTime(new Date());
        record.setNote(errorCode.getMessage());
        final UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(username);
        adminMapper.updateByExampleSelective(record, example);
    }

    @Override
    public UmsAdmin getItem(final Long id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<UmsAdmin> list(final String keyword, final Integer pageSize, final Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        final UmsAdminExample example = new UmsAdminExample();
        UmsAdminExample.Criteria criteria = example.createCriteria();
        if (!StringUtils.isEmpty(keyword)) {
            criteria.andUsernameLike("%" + keyword + "%");
            example.or(example.createCriteria().andNickNameLike("%" + keyword + "%"));
        }
        return adminMapper.selectByExample(example);
    }

    @Override
    public int update(final Long id, final UmsAdmin admin) {
        admin.setId(id);
        final UmsAdmin rawAdmin = adminMapper.selectByPrimaryKey(id);
        if (rawAdmin.getPassword().equals(admin.getPassword())) {
            //与原加密密码相同的不需要修改
            admin.setPassword(null);
        } else {
            //与原加密密码不同的需要加密修改
            if (StrUtil.isEmpty(admin.getPassword())) {
                admin.setPassword(null);
            } else {
                admin.setPassword(BCrypt.hashpw(admin.getPassword()));
            }
        }
        final int count = adminMapper.updateByPrimaryKeySelective(admin);
        adminCacheService.delAdmin(id);
        return count;
    }

    @Override
    public int delete(final Long id) {
        final int count = adminMapper.deleteByPrimaryKey(id);
        adminCacheService.delAdmin(id);
        return count;
    }

    @Override
    public int updateRole(final Long adminId, final List<Long> roleIds) {
        final int count = roleIds == null ? 0 : roleIds.size();
        //先删除原来的关系
        final UmsAdminRoleRelationExample adminRoleRelationExample = new UmsAdminRoleRelationExample();
        adminRoleRelationExample.createCriteria().andAdminIdEqualTo(adminId);
        adminRoleRelationMapper.deleteByExample(adminRoleRelationExample);
        //建立新关系
        if (!CollectionUtils.isEmpty(roleIds)) {
            final List<UmsAdminRoleRelation> list = new ArrayList<>();
            for (Long roleId : roleIds) {
                final UmsAdminRoleRelation roleRelation = new UmsAdminRoleRelation();
                roleRelation.setAdminId(adminId);
                roleRelation.setRoleId(roleId);
                list.add(roleRelation);
            }
            adminRoleRelationDao.insertList(list);
        }
        return count;
    }

    @Override
    public List<UmsRole> getRoleList(final Long adminId) {
        return adminRoleRelationDao.getRoleList(adminId);
    }

    @Override
    public List<UmsResource> getResourceList(final Long adminId) {
        return adminRoleRelationDao.getResourceList(adminId);
    }

    @Override
    public int updatePassword(final UpdateAdminPasswordParam param) {
        if (StrUtil.isEmpty(param.getUsername())
                || StrUtil.isEmpty(param.getOldPassword())
                || StrUtil.isEmpty(param.getNewPassword())) {
            return -1;
        }
        final UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(param.getUsername());
        final List<UmsAdmin> adminList = adminMapper.selectByExample(example);
        if (CollUtil.isEmpty(adminList)) {
            return -2;
        }
        final UmsAdmin umsAdmin = adminList.get(0);
        if (!BCrypt.checkpw(param.getOldPassword(), umsAdmin.getPassword())) {
            return -3;
        }
        umsAdmin.setPassword(BCrypt.hashpw(param.getNewPassword()));
        adminMapper.updateByPrimaryKey(umsAdmin);
        adminCacheService.delAdmin(umsAdmin.getId());
        return 1;
    }

    @Override
    public UserDto loadUserByUsername(final String username) {
        //获取用户信息
        final UmsAdmin admin = getAdminByUsername(username);
        if (admin != null) {
            final List<UmsRole> roleList = getRoleList(admin.getId());
            final UserDto userDTO = new UserDto();
            BeanUtils.copyProperties(admin, userDTO);
            if (CollUtil.isNotEmpty(roleList)) {
                final List<String> roleStrList = roleList.stream().map(item -> item.getId() + "_" + item.getName()).collect(Collectors.toList());
                userDTO.setRoles(roleStrList);
            }
            return userDTO;
        }
        return null;
    }

    @Override
    public UmsAdmin getCurrentAdmin() {
        final String userStr = request.getHeader(AuthConstant.USER_TOKEN_HEADER);
        if (StrUtil.isEmpty(userStr)) {
            Asserts.fail(ResultCode.UNAUTHORIZED);
        }
        final UserDto userDto = JSONUtil.toBean(userStr, UserDto.class);
        UmsAdmin admin = adminCacheService.getAdmin(userDto.getId());
        if (admin == null) {
            admin = adminMapper.selectByPrimaryKey(userDto.getId());
            adminCacheService.setAdmin(admin);
        }
        return admin;
    }
}
