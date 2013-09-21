package org.minispm.security.service;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.WildcardPermission;

import java.util.List;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-12
 * Time: PM10:23
 * To change this template use File | Settings | File Templates.
 */
public class WildcardPermissionCustom extends WildcardPermission{
    protected WildcardPermissionCustom(){}
    public WildcardPermissionCustom(String wildcardString){
        super(wildcardString);
    }
    public WildcardPermissionCustom(String wildcardString, boolean caseSensitive) {
        super(wildcardString, caseSensitive);
    }

    @Override
    public boolean implies(Permission p) {
        if(!(p instanceof WildcardPermissionCustom)){
            return false;
        }

        WildcardPermissionCustom wpc = (WildcardPermissionCustom)p;
        List<Set<String>> otherParts = wpc.getParts();
        int i = 0;
        for (Set<String> otherPart : otherParts) {
            // If this permission has less parts than the other permission, everything after the number of parts contained
            // in this permission is automatically implied, so return true
            if (getParts().size() - 1 < i) {
                return true;
            } else {
                Set<String> part = getParts().get(i);
                if (!part.contains(WILDCARD_TOKEN) && !part.containsAll(otherPart) && !otherPart.contains(WILDCARD_TOKEN)) {
                    return false;
                }
                i++;
            }
        }
        // If this permission has more parts than the other parts, only imply it if all of the other parts are wildcards
        for (; i < getParts().size(); i++) {
            Set<String> part = getParts().get(i);
            if (!part.contains(WILDCARD_TOKEN)) {
                return false;
            }
        }

        return true;
    }
}
