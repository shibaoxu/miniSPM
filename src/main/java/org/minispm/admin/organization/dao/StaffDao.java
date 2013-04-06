package org.minispm.admin.organization.dao;

import org.minispm.admin.organization.entity.Department;
import org.minispm.admin.organization.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午7:56
 */
public interface StaffDao extends JpaRepository<Staff, String>,JpaSpecificationExecutor<Department> {
}
