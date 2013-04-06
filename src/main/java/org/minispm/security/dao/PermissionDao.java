package org.minispm.security.dao;

import org.minispm.security.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-10
 * Time: 下午3:25
 * To change this template use File | Settings | File Templates.
 */
public interface PermissionDao extends JpaRepository<Permission, String> {
}
