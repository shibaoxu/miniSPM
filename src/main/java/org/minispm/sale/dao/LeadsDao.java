package org.minispm.sale.dao;

import org.minispm.sale.entity.Leads;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午6:27
 */
public interface LeadsDao extends JpaRepository<Leads, String>, JpaSpecificationExecutor<Leads> {

    @Modifying
    @Query("update Leads leads set leads.lastInfo = ?2, leads.lastModifiedDate = ?3 where leads.id = ?1 ")
    void updateLastActionInfo(String id, String info, Date lastModifiedDate);

    @Modifying
    @Query(value = "update ILA_LEADS l set l.opportunity = true , plan_deal_date = :planDealDate, " +
            "low_amount = :lowAmount, high_amount = :highAmount where id = :id", nativeQuery = true)
    void convertToOpportunity(@Param("id") String id,
                              @Param("planDealDate") Date planDealDate,
                              @Param("lowAmount")double lowAmount,
                              @Param("highAmount")double highAmount);
}
