package org.minispm.admin.organization.dao;

import org.minispm.admin.organization.entity.Unit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午10:52
 */
public interface UnitDao extends JpaRepository<Unit, String>, JpaSpecificationExecutor<Unit> {

}
