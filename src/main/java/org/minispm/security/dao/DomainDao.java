package org.minispm.security.dao;

import org.minispm.security.entity.Domain;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-16
 * Time: PM4:46
 * To change this template use File | Settings | File Templates.
 */
public interface DomainDao extends JpaRepository<Domain, String> {
}
