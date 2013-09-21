package org.minispm.security.service;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.PermissionResolver;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-12
 * Time: PM10:20
 * To change this template use File | Settings | File Templates.
 */
public class PermissionResolverCustom implements PermissionResolver {
    @Override
    public Permission resolvePermission(String permissionString) {
        return new WildcardPermissionCustom(permissionString);
    }
}
