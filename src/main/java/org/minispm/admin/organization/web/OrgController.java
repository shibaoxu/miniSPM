package org.minispm.admin.organization.web;

import org.minispm.admin.organization.dao.AccountabilityTypeDao;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.service.DepartmentService;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.admin.organization.utils.UnitTree;
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
    private DepartmentService departmentService;

    @RequestMapping("/structure")
    public String index(){
        return "admin/org/structure";
    }

    @RequestMapping(value = "/structure/{orgTypeId}/{filters}", produces = "application/json")
    @ResponseBody
    public UnitTree getStructureJSON(@PathVariable String orgTypeId, @PathVariable("filters") String filters){
        AccountabilityType orgType = new AccountabilityType();
        orgType.setId(orgTypeId);
        UnitTree unit = orgService.getStructure(orgTypeId, filters);
        return unit;
    }


    @RequestMapping(value = "/structure/{orgTypeId}", produces = "application/json")
    @ResponseBody
    public UnitTree getStructureJSON(@PathVariable String orgTypeId){
        AccountabilityType orgType = new AccountabilityType();
        orgType.setId(orgTypeId);
        UnitTree unit = orgService.getStructure(orgTypeId);
        System.out.println(departmentService.getUnassignedDepartments(orgTypeId).size());
        return unit;
    }

    @RequestMapping(value = "/structure/{orgTypeId}/removeUnit/{unitId}",method = RequestMethod.POST/*, produces = "application/json"*/)
    @ResponseBody
    public String removeUnitFromTree(@PathVariable("orgTypeId") String orgTypeId, @PathVariable("unitId") String unitId){
        orgService.removeUnitFromTree(orgTypeId, unitId);
        return "success";
    }

    @RequestMapping(value = "/structure/{orgTypeId}/addUnit/{parentId}/{unitId}", method = RequestMethod.POST)
    @ResponseBody
    public String addUnitToTree(@PathVariable("orgTypeId") String orgTypeId, @PathVariable("parentId") String parentId, @PathVariable("unitId") String unitId){
        orgService.addUnitToTree(orgTypeId, parentId, unitId);
        return "success";
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

    @Autowired
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
}
