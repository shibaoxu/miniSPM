package org.minispm.sale.service;

import org.minispm.sale.dao.LeadsBaseDao;
import org.minispm.sale.entity.LeadsBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-3-18
 * Time: 下午4:03
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(readOnly = true)
public class LeadsBaseService {
    private LeadsBaseDao leadsBaseDao;
    @Transactional(readOnly = false)
    public void updateLastActionBrief(String leadsId, String lastActionInfo){
        leadsBaseDao.updateLastActionInfo(leadsId, lastActionInfo, new Date());
    }

    public LeadsBase findById(String id){
        return leadsBaseDao.findOne(id);
    }


    @Autowired
    public void setLeadsBaseDao(LeadsBaseDao leadsBaseDao) {
        this.leadsBaseDao = leadsBaseDao;
    }
}
