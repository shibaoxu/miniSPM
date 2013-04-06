package org.minispm.sale.service;

import org.minispm.sale.dao.ClosedReasonDao;
import org.minispm.sale.entity.ClosedReason;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-29
 * Time: 下午9:44
 */
@Service
@Transactional(readOnly = true)
public class ClosedReasonService {

    private ClosedReasonDao closedReasonDao;

    public List<ClosedReason> findAll(){
        return closedReasonDao.findAll();
    }

    public ClosedReasonDao getClosedReasonDao() {
        return closedReasonDao;
    }

    @Autowired
    public void setClosedReasonDao(ClosedReasonDao closedReasonDao) {
        this.closedReasonDao = closedReasonDao;
    }
}
