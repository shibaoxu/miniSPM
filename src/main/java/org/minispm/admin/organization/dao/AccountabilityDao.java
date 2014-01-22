package org.minispm.admin.organization.dao;

import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Accountability;
import org.minispm.admin.organization.entity.Unit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午7:50
 */
public interface AccountabilityDao extends JpaRepository<Accountability, String> {
    List<Accountability> findByAccountabilityTypeAndParent(AccountabilityType accountabilityType, Unit parent);
    Accountability findByAccountabilityTypeAndChild(AccountabilityType accountabilityType, Unit child);
    Accountability findByAccountabilityTypeIdAndChildId(String accountabilityTypeId, String childId);

    List<Accountability> findByAccountabilityTypeId(String accountabilityTypeId);

    @Query(value = "select a from Accountability a where a.parent.id = a.child.id and a.accountabilityType.id = ?1")
    List<Accountability> findRoot(String accountabilityTypeId);

    @Query("select a from Accountability a where a.parent.id != a.child.id and a.parent.id = ?1  and a.accountabilityType.id = ?2")
    List<Accountability> getChildren(String parentId, String accountabilityTypeId);

    @Query("select a from Accountability a where a.parent.id != a.child.id and a.accountabilityType.id = ?1 and a.child.id = ?2")
    Accountability getParent(String accountabilityTypeId, String unitId);

    List<Accountability> findByAccountabilityTypeIdAndParentId(String accountabilityTypeId, String parentId);

}
