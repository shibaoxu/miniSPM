package org.minispm.sale.service;

import org.minispm.sale.dao.ClosedReasonDao;
import org.minispm.sale.dao.LeadsBaseDao;
import org.minispm.sale.entity.Action;
import org.minispm.sale.entity.ClosedReason;
import org.minispm.sale.entity.LeadsBase;
import org.minispm.security.dao.UserDao;
import org.minispm.security.entity.User;
import org.minispm.security.service.ShiroDbRealm;
import org.minispm.security.utils.SecurityUtils;
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
    @Autowired
    private LeadsBaseDao leadsBaseDao;
    @Autowired
    private ClosedReasonDao closedReasonDao;
    @Autowired
    private UserDao userDao;

    @Transactional(readOnly = false)
    public void updateLastActionBrief(String leadsId, String lastActionInfo){
        leadsBaseDao.updateLastActionInfo(leadsId, lastActionInfo, new Date());
    }

    public LeadsBase findById(String id){
        return leadsBaseDao.findOne(id);
    }

    @Transactional(readOnly = false)
    public void close(String leadsBaseId, String closedReasonId, String closedDetail){
        LeadsBase leadsBase = leadsBaseDao.findOne(leadsBaseId);
        ClosedReason closeReason = closedReasonDao.findOne(closedReasonId);
        leadsBase.close(closeReason, closedDetail);
        addEvent(Action.CLOSE, leadsBase);
        leadsBaseDao.save(leadsBase);
    }

    protected void addEvent(String eventType, LeadsBase leadsBase){
        Action event = new Action(eventType);
        event.setOwner(userDao.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName()));
        leadsBase.addAction(event);
        leadsBase.setLastInfo(event.buildActionInfo());
        leadsBase.setLastModifiedDate(new Date());

    }
//    @Autowired
//    public void setLeadsBaseDao(LeadsBaseDao leadsBaseDao) {
//        this.leadsBaseDao = leadsBaseDao;
//    }
//
//    @Autowired
//    public void setClosedReasonDao(ClosedReasonDao closedReasonDao) {
//        this.closedReasonDao = closedReasonDao;
//    }
}
