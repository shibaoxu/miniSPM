package org.minispm.sale.dao;

import org.minispm.sale.entity.Ownership;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * User: shibaoxu
 * Date: 13-1-23
 * Time: 下午6:37
 */
public interface OwnershipDao extends JpaRepository<Ownership, String> {
}
