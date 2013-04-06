package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.AccountabilityTypeDao;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-30
 * Time: 下午7:35
 */
@Service
@Transactional(readOnly = true)
public class AccountabilityTypeService {
    private AccountabilityTypeDao accountabilityTypeDao;

    public List<AccountabilityType> findAll(){
        return accountabilityTypeDao.findAll();
    }

    public AccountabilityTypeDao getAccountabilityDao() {
        return accountabilityTypeDao;
    }

    @Autowired
    public void setAccountabilityDao(AccountabilityTypeDao accountabilityTypeDao) {
        this.accountabilityTypeDao = accountabilityTypeDao;
    }
}
