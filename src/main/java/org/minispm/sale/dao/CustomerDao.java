package org.minispm.sale.dao;

import org.minispm.sale.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * User: shibaoxu
 * Date: 12-12-18
 * Time: 下午9:37
 */
public interface CustomerDao extends JpaRepository<Customer, String>, JpaSpecificationExecutor<Customer> {
}
