package org.minispm.security.service;

import org.minispm.security.dao.DomainDao;
import org.minispm.security.entity.Domain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-16
 * Time: PM4:47
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(readOnly = true)
public class DomainService {
    private DomainDao domainDao;
    public List<Domain> getAll(){
        return domainDao.findAll();
    }

    public DomainDao getDomainDao() {
        return domainDao;
    }

    @Autowired
    public void setDomainDao(DomainDao domainDao) {
        this.domainDao = domainDao;
    }
}
