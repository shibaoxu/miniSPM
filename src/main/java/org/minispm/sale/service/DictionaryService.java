package org.minispm.sale.service;

import org.minispm.sale.dao.IndustryDao;
import org.minispm.sale.dao.OwnershipDao;
import org.minispm.sale.entity.Industry;
import org.minispm.sale.entity.Ownership;
import org.minispm.sale.entity.Scale;
import org.minispm.sale.dao.ScaleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-23
 * Time: 下午6:38
 */
@Service
@Transactional(readOnly = true)
public class DictionaryService {
    private IndustryDao industryDao;
    private ScaleDao scaleDao;
    private OwnershipDao ownershipDao;

    public List<Industry> getAllIndustry(){
        return industryDao.findAll();
    }

    public List<Scale> getAllScale(){
        return scaleDao.findAll();
    }

    public List<Ownership> getAllOwnership(){
        return ownershipDao.findAll();
    }

    public IndustryDao getIndustryDao() {
        return industryDao;
    }

    @Autowired
    public void setIndustryDao(IndustryDao industryDao) {
        this.industryDao = industryDao;
    }

    public ScaleDao getScaleDao() {
        return scaleDao;
    }

    @Autowired
    public void setScaleDao(ScaleDao scaleDao) {
        this.scaleDao = scaleDao;
    }

    public OwnershipDao getOwnershipDao() {
        return ownershipDao;
    }

    @Autowired
    public void setOwnershipDao(OwnershipDao ownershipDao) {
        this.ownershipDao = ownershipDao;
    }
}
