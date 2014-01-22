package org.minispm.security.dao;

import org.minispm.security.entity.Domain;
import org.minispm.security.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-10
 * Time: 下午3:25
 * To change this template use File | Settings | File Templates.
 */
public interface PermissionDao extends JpaRepository<Permission, String> {
    List<Permission> findByOperationDomainId(String id);
    List<Permission> findByOperationIdAndScope(String operationId, String scope);
}
