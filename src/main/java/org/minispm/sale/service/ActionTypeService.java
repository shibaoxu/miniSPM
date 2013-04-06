package org.minispm.sale.service;

import org.minispm.sale.dao.ActionTypeDao;
import org.minispm.sale.entity.ActionType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-31
 * Time: 下午1:38
 */
@Service
@Transactional(readOnly = true)
public class ActionTypeService {

    private ActionTypeDao actionTypeDao;

    public List<ActionType> findAll(){
        return actionTypeDao.findAll();
    }
    public ActionTypeDao getActionTypeDao() {
        return actionTypeDao;
    }

    @Autowired
    public void setActionTypeDao(ActionTypeDao actionTypeDao) {
        this.actionTypeDao = actionTypeDao;
    }
}
