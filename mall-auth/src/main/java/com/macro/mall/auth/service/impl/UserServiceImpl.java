package com.macro.mall.auth.service.impl;

import com.macro.mall.auth.constant.MessageConstant;
import com.macro.mall.auth.domain.SecurityUser;
import com.macro.mall.auth.service.UmsAdminService;
import com.macro.mall.auth.service.UmsMemberService;
import com.macro.mall.common.constant.AuthConstant;
import com.macro.mall.common.domain.UserDto;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户管理业务类
 */
@AllArgsConstructor
@Service
public class UserServiceImpl implements UserDetailsService {

    private final UmsAdminService adminService;
    private final UmsMemberService memberService;
    private final HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        final String clientId = request.getParameter("client_id");
        final boolean isAdminClient = AuthConstant.ADMIN_CLIENT_ID.equals(clientId);
        final UserDto userDto = isAdminClient ? adminService.loadUserByUsername(username) : memberService.loadUserByUsername(username);
        if (userDto == null) {
            throw new UsernameNotFoundException(MessageConstant.USERNAME_PASSWORD_ERROR);
        }
        userDto.setClientId(clientId);
        final SecurityUser securityUser = new SecurityUser(userDto);
        if (!securityUser.isEnabled()) {
            throw new DisabledException(MessageConstant.ACCOUNT_DISABLED);
        } else if (!securityUser.isAccountNonLocked()) {
            throw new LockedException(MessageConstant.ACCOUNT_LOCKED);
        } else if (!securityUser.isAccountNonExpired()) {
            throw new AccountExpiredException(MessageConstant.ACCOUNT_EXPIRED);
        } else if (!securityUser.isCredentialsNonExpired()) {
            throw new CredentialsExpiredException(MessageConstant.CREDENTIALS_EXPIRED);
        }
        return securityUser;
    }

}
