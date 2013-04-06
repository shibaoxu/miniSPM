package org.minispm.sale.dao;

import org.minispm.sale.entity.MarketAction;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-21
 * Time: 下午6:03
 */
public interface MarketActionDaoCustom {
    List<MarketAction> findAll();
}
