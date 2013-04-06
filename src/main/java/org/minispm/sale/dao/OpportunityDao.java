package org.minispm.sale.dao;

import org.minispm.sale.entity.Opportunity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-3-13
 * Time: 下午10:48
 * To change this template use File | Settings | File Templates.
 */
public interface OpportunityDao extends JpaRepository<Opportunity, String>, JpaSpecificationExecutor<Opportunity> {

}
