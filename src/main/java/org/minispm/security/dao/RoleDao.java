package org.minispm.security.dao;

import org.minispm.security.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * User: shibaoxu
 * Date: 13-1-19
 * Time: 下午6:53
 */
public interface RoleDao extends JpaRepository<Role, String>, JpaSpecificationExecutor<Role> {
    @Modifying
    @Query(value = "delete from ila_user_role where role_id = ?1 and user_id = ?2", nativeQuery = true)
    void removeUser(String roleId, String userId);
}
