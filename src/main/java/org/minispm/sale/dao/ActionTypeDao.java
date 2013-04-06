package org.minispm.sale.dao;

import org.minispm.sale.entity.ActionType;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * User: shibaoxu
 * Date: 12-12-31
 * Time: 下午1:37
 */
public interface ActionTypeDao extends JpaRepository<ActionType, String> {
}
