package org.minispm.sale.dao;

import org.minispm.sale.entity.MarketAction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * User: shibaoxu
 * Date: 13-1-29
 * Time: 下午5:18
 */
public interface MarketActionDao extends JpaRepository<MarketAction, String>, JpaSpecificationExecutor<MarketAction> {
}
