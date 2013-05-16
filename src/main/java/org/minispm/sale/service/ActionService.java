package org.minispm.sale.service;

import org.minispm.sale.dao.ActionDao;
import org.minispm.sale.entity.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-30
 * Time: 下午8:54
 */
@Service
@Transactional(readOnly = true)
public class ActionService {

    private ActionDao actionDao;
    private LeadsBaseService leadsBaseService;

    public List<Action> findAll(String leadsBaseId){
        return actionDao.findByLeads(leadsBaseId);
    }

    public Action findByIdView(String id){
        Action action = actionDao.findOne(id);
        return action;
    }

    public Action findByIdEdit(String id){
        Action action = actionDao.findOne(id);
        return action;
    }

    @Transactional(readOnly = false)
    public Action save(Action action){
        leadsBaseService.updateLastActionBrief(action.getLeadsBase().getId(), action.buildActionInfo());
        return actionDao.save(action);
    }

    @Autowired
    public void setActionDao(ActionDao actionDao) {
        this.actionDao = actionDao;
    }

    @Autowired
    public void setLeadsBaseService(LeadsBaseService leadsBaseService) {
        this.leadsBaseService = leadsBaseService;
    }
}
