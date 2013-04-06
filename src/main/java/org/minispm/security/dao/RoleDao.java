package org.minispm.security.dao;

import org.minispm.security.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * User: shibaoxu
 * Date: 13-1-19
 * Time: 下午6:53
 */
public interface RoleDao extends JpaRepository<Role, String>, JpaSpecificationExecutor<Role> {
}
