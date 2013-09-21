package org.minispm.security.service;

import org.minispm.security.dao.OperationDao;
import org.minispm.security.entity.Domain;
import org.minispm.security.entity.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-21
 * Time: AM11:34
 * To change this template use File | Settings | File Templates.
 */
@Service
public class OperationService {
    private OperationDao operationDao;

    public List<Operation> findByDomain(String domainId){
        Domain domain = new Domain();
        domain.setId(domainId);
        return operationDao.findByDomain(domain);
    }
    public List<Operation> findAll(){
        return operationDao.findAll();
    }

    @Autowired
    public void setOperationDao(OperationDao operationDao) {
        this.operationDao = operationDao;
    }

}
