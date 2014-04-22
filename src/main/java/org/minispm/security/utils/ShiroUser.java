package org.minispm.security.utils;

import com.google.common.base.Objects;

import java.io.Serializable;

/**
 * Created by shibaoxu on 4/22/14.
 */
public class ShiroUser implements Serializable {
    private static final long serialVersionUID = -1373760761780840081L;
    public String id;
    public String loginName;
    public String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public ShiroUser(String id, String loginName, String name) {
        this.id = id;
        this.loginName = loginName;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    @Override
    public String toString() {
        return name;
    }

    /**
     * 重载hashCode,只计算loginName;
     */
    @Override
    public int hashCode() {
        return Objects.hashCode(loginName);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginName() {
        return loginName;

    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    /**
     * 重载equals,只计算loginName;
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ShiroUser other = (ShiroUser) obj;
        if (loginName == null) {
            if (other.loginName != null)
                return false;

        } else if (!loginName.equals(other.loginName))
            return false;
        return true;
    }
}
