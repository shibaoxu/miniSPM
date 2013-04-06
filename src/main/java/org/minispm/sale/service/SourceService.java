package org.minispm.sale.service;

import org.minispm.sale.entity.Source;
import org.minispm.sale.dao.SourceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-29
 * Time: 下午9:00
 */
@Service
@Transactional(readOnly = true)
public class SourceService {
    private SourceDao sourceDao;

    public List<Source> findAll(){
        return sourceDao.findAll();
    }

    public SourceDao getSourceDao() {
        return sourceDao;
    }

    @Autowired
    public void setSourceDao(SourceDao sourceDao) {
        this.sourceDao = sourceDao;
    }
}
