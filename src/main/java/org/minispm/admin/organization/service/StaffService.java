package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.AccountabilityDao;
import org.minispm.admin.organization.dao.StaffDao;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.admin.organization.entity.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-30
 * Time: 下午7:06
 */
@Service
@Transactional(readOnly = true)
public class StaffService {
    private StaffDao staffDao;

    private AccountabilityDao orgAccountabilityDao;
    private OrganizationService organizationService;

    public Unit getBelongUnit(String id, AccountabilityType orgAccountabilityType){
//        organizationService.getParent(orgAccountabilityType,)
        return null;
    }

    /*=======Staff operation=================*/
    @Transactional(readOnly = false)
    public Staff saveStaff(Staff staff){
        return staffDao.save(staff);
    }

    public Staff findStaffById(String id){
        return staffDao.findOne(id);
    }

    public List<Staff> findAllStaff(){
        return staffDao.findAll();
    }

    public OrganizationService getOrganizationService() {
        return organizationService;
    }

    @Autowired
    public void setOrganizationService(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    public AccountabilityDao getOrgAccountabilityDao() {
        return orgAccountabilityDao;
    }

    @Autowired
    public void setOrgAccountabilityDao(AccountabilityDao orgAccountabilityDao) {
        this.orgAccountabilityDao = orgAccountabilityDao;
    }

    public StaffDao getStaffDao() {
        return staffDao;
    }

    @Autowired
    public void setStaffDao(StaffDao staffDao) {
        this.staffDao = staffDao;
    }
}
