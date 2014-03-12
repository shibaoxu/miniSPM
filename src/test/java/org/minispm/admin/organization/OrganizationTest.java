package org.minispm.admin.organization;

import org.junit.Test;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.admin.organization.entity.Unit;
import org.minispm.util.SpringTransactionalTestCase;

import org.minispm.admin.organization.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.util.Assert;

import java.util.List;

/**
* User: shibaoxu
* Date: 12-12-2
* Time: 下午9:24
*/
@ActiveProfiles("dev")
public class OrganizationTest extends SpringTransactionalTestCase {

    @Autowired
    private OrganizationService organizationService;

    @Test
    public void foo(){

    }
//
//    @Test
//    public void getRoot() {
//        Unit orgRoot = organizationService.getRoot(AccountabilityType.ADMINISTRATOR_ORG);
//        Assert.isNull(orgRoot);
//        Unit saleRoot = organizationService.getRoot(AccountabilityType.SALE_ORG);
//        Assert.isTrue(saleRoot.getId().equals("1"));
//        Assert.isTrue(saleRoot.getName().equals("上海新致"));
//    }
//
//    @Test
//    public void BelongOrg() {
//        Unit unit = organizationService.getBelongOrg(AccountabilityType.SALE_ORG, "25");
//        Assert.isTrue("12".equals(unit.getId()));
//    }
//
//    @Test
//    public void getChildren() {
//        List<Unit> children1 = organizationService.getChildren("1", AccountabilityType.SALE_ORG);
//        Assert.isTrue(children1.size() == 2);
//        List<Unit> children2 = organizationService.getChildren("2", AccountabilityType.SALE_ORG);
//        Assert.isTrue(children2.size() == 4);
//        List<Unit> children3 = organizationService.getChildren("23", AccountabilityType.SALE_ORG);
//        Assert.isTrue(children3.size() == 1);
//    }
//
//    @Test
//    public void getBelongAndDescendantsOrg(){
//        List<Unit> descendants = organizationService.getBelongAndDescendantOrg("21", AccountabilityType.SALE_ORG);
//        Assert.isTrue(descendants.size() == 6);
//
//        List<Unit> descendants1 = organizationService.getBelongAndDescendantOrg("27", AccountabilityType.SALE_ORG);
//        Assert.isTrue(descendants1.size() == 9);
//
//    }
//
//    @Test
//    public void getSelfAndDescendantStaff(){
//        List<Staff> descendants = organizationService.getSelfAndDescendantStaff("23", AccountabilityType.SALE_ORG);
//        Assert.isTrue(descendants.size() == 2);
//        List<Staff> descendants1 = organizationService.getSelfAndDescendantStaff("21", AccountabilityType.SALE_ORG);
//        Assert.isTrue(descendants1.size() == 1);
//
//    }


}
