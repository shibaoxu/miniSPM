package org.minispm.sale.dao;

import org.minispm.sale.entity.Action;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-30
 * Time: 下午8:53
 */
public interface ActionDao extends JpaRepository<Action, String>, JpaSpecificationExecutor<Action> {
    @Query("select a from Action a where a.leadsBase.id = ?1 order by a.lastModifiedDate DESC ")
    List<Action> findByLeads(String leadsId);
}
