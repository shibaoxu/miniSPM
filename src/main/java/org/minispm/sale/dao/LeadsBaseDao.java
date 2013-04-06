package org.minispm.sale.dao;

import org.minispm.sale.entity.LeadsBase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-3-18
 * Time: 下午3:56
 * To change this template use File | Settings | File Templates.
 */
public interface LeadsBaseDao extends JpaRepository<LeadsBase, String>, JpaSpecificationExecutor<LeadsBase> {
    @Modifying
    @Query("update LeadsBase l set l.lastInfo = ?2, l.lastModifiedDate = ?3 where l.id = ?1 ")
    void updateLastActionInfo(String id, String info, Date lastModifiedDate);

}
