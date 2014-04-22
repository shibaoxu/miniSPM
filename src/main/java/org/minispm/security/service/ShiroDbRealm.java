package org.minispm.security.service;

import com.google.common.base.Objects;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.permission.PermissionResolver;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.minispm.core.utils.Encodes;
import org.minispm.security.entity.User;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.security.utils.ShiroUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.Serializable;

/**
 * User: shibaoxu
 * Date: 13-1-2
 * Time: 下午5:44
 */
public class ShiroDbRealm extends AuthorizingRealm {
    private static Logger logger = LoggerFactory.getLogger(ShiroDbRealm.class);

    private UserService accountService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        logger.info("Token trying to login. username[{}], password[{}]", token.getUsername(), token.getPassword());
        User user = accountService.findByJobNumber(token.getUsername());
        logger.debug("User's information are : userName[{}], password[{}], salt[{}]", user.getName(), user.getPassword(), user.getSalt());
        if (user != null) {
            ShiroUser shiroUser = new ShiroUser(user.getId(), user.getLoginName(), user.getName());
            byte[] salt = Encodes.decodeHex(user.getSalt());
            return new SimpleAuthenticationInfo(shiroUser,
                    user.getPassword(), ByteSource.Util.bytes(salt), getName());
        } else {
            return null;
        }
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        User user = accountService.findByJobNumber(shiroUser.getLoginName());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(accountService.getRolesByJobNumber(user.getJobNumber()));
        info.addStringPermissions(accountService.getPermissionsByUserId(user.getId()));
        return info;
    }

    @Override
    public void setPermissionResolver(PermissionResolver permissionResolver) {
        super.setPermissionResolver(permissionResolver);    //To change body of overridden methods use File | Settings | File Templates.
    }

    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(UserService.HASH_ALGORITHM);
        matcher.setHashIterations(UserService.HASH_INTERATIONS);

        setCredentialsMatcher(matcher);
    }

    public UserService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(UserService accountService) {
        this.accountService = accountService;
    }

}
