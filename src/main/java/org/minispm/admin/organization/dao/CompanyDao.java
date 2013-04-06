package org.minispm.admin.organization.dao;

import org.minispm.admin.organization.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午7:55
 */
public interface CompanyDao extends JpaRepository<Company, String>,JpaSpecificationExecutor<Company>  {
    public Company findByName(String name);
}
