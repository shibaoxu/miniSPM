package org.minispm.security.dao;

import org.minispm.security.entity.Domain;
import org.minispm.security.entity.Operation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-21
 * Time: AM10:43
 * To change this template use File | Settings | File Templates.
 */
public interface OperationDao extends JpaRepository<Operation, String>, JpaSpecificationExecutor<Operation> {
    List<Operation> findByDomain(Domain domain);
}
