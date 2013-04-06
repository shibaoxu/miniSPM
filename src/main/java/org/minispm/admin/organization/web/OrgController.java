package org.minispm.admin.organization.web;

import org.minispm.admin.organization.dao.AccountabilityTypeDao;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.admin.organization.utils.UnitForTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午1:41
 */
@Controller
@RequestMapping("/admin/org")
public class OrgController {
    private OrganizationService orgService;
    private AccountabilityTypeDao accountabilityTypeDao;

    @RequestMapping("/structure")
    public String index(){
        return "admin/org/structure";
    }

    @RequestMapping(value = "/structure/{orgTypeId}", produces = "application/json")
    @ResponseBody
    public UnitForTree getStructureJSON(@PathVariable String orgTypeId){
        AccountabilityType orgType = new AccountabilityType();
        orgType.setId(orgTypeId);
        UnitForTree unit = orgService.getStructure(orgTypeId);
        return unit;
    }

    @ModelAttribute("orgType")
    public List<AccountabilityType> getAccountabilityType(){
        return accountabilityTypeDao.findAll();
    }
    public OrganizationService getOrgService() {
        return orgService;
    }

    @Autowired
    public void setOrgService(OrganizationService orgService) {
        this.orgService = orgService;
    }

    public AccountabilityTypeDao getAccountabilityTypeDao() {
        return accountabilityTypeDao;
    }

    @Autowired
    public void setAccountabilityTypeDao(AccountabilityTypeDao accountabilityTypeDao) {
        this.accountabilityTypeDao = accountabilityTypeDao;
    }
}
