package org.minispm.admin.organization.dao;

import org.minispm.admin.organization.entity.Department;
import org.minispm.admin.organization.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午7:56
 */
public interface StaffDao extends JpaRepository<Staff, String>,JpaSpecificationExecutor<Department> {
    @Query(value = "select a from Staff a where a.id not in (select b.parent.id from Accountability b where b.accountabilityType.id = ?1)\n" +
            "and a.id not in (select b.child.id from Accountability b where b.accountabilityType.id = ?1)")
    List<Staff> getUnassignedStaffs(String orgTypeId);
}
