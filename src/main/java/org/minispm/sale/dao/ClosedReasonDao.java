package org.minispm.sale.dao;

import org.minispm.sale.entity.ClosedReason;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * User: shibaoxu
 * Date: 12-12-29
 * Time: 下午9:42
 */
public interface ClosedReasonDao extends JpaRepository<ClosedReason, String> {
}
