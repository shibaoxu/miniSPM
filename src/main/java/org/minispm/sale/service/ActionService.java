package org.minispm.sale.service;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.minispm.sale.dao.ActionDao;
import org.minispm.sale.entity.Action;
import org.minispm.sale.entity.Leads;
import org.minispm.sale.entity.LeadsBase;
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
    private LeadsService leadsService;
    private OpportunityService opportunityService;

    public List<Action> findAll(String leadsBaseId){
        requireViewPermission(leadsBaseId);
        return actionDao.findByLeads(leadsBaseId);
    }

    public Action findByIdView(String id){
        Action action = actionDao.findOne(id);
        requireViewPermission(action.getLeadsBase().getId());
        return action;
    }

    public Action findByIdEdit(String id){
        Action action = actionDao.findOne(id);
        requireEditPermission(action.getLeadsBase().getId());
        return action;
    }

    @Transactional(readOnly = false)
    public Action save(Action action){
        requireEditPermission(action.getLeadsBase().getId());
        leadsBaseService.updateLastActionBrief(action.getLeadsBase().getId(), action.buildActionInfo());
        return actionDao.save(action);
    }

    private void requireViewPermission(String leadsBaseId){
        LeadsBase leadsBase = leadsBaseService.findById(leadsBaseId);
        if (leadsBase instanceof Leads){
            leadsService.findByIdView(leadsBaseId);
        }else{
            opportunityService.findByIdView(leadsBaseId);
        }
    }

    private void requireEditPermission(String leadsBaseId){
        LeadsBase leadsBase = leadsBaseService.findById(leadsBaseId);
        if (leadsBase instanceof Leads){
            leadsService.findByIdEdit(leadsBaseId);
        }else{
            opportunityService.findByIdEdit(leadsBaseId);
        }
    }
    @Autowired
    public void setActionDao(ActionDao actionDao) {
        this.actionDao = actionDao;
    }

    @Autowired
    public void setLeadsBaseService(LeadsBaseService leadsBaseService) {
        this.leadsBaseService = leadsBaseService;
    }

    @Autowired
    public void setLeadsService(LeadsService leadsService) {
        this.leadsService = leadsService;
    }

    @Autowired
    public void setOpportunityService(OpportunityService opportunityService) {
        this.opportunityService = opportunityService;
    }
}
