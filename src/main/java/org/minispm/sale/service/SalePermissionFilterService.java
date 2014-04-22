package org.minispm.sale.service;

import org.apache.shiro.subject.Subject;
import org.minispm.sale.entity.MarketAction;
import org.minispm.sale.entity.Opportunity;
import org.minispm.security.service.UserService;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.admin.organization.entity.Unit;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.sale.entity.Leads;
import org.minispm.security.entity.User;
import org.minispm.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-29
 * Time: 下午6:36
 */
@Service
@Transactional(readOnly = true)
public class SalePermissionFilterService {
    private OrganizationService organizationService;
    private UserService userService;

    public Specification<MarketAction> listMarketAction() {
        return new Specification<MarketAction>() {
            @Override
            public Predicate toPredicate(Root<MarketAction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("market_action:list:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("market_action:list:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("market_action:list:BELONG")) {
                    query.orderBy(cb.asc(root.get("createdDate")));
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("market_action:list:SELFANDLOW")) {
                    query.orderBy(cb.asc(root.get("createdDate")));
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("market_action:list:SELF")) {
                    query.orderBy(cb.asc(root.get("createdDate")));
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }

    public Specification<MarketAction> viewMarketAction() {
        return new Specification<MarketAction>() {
            @Override
            public Predicate toPredicate(Root<MarketAction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("market_action:view:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("market_action:view:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("market_action:view:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("market_action:view:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("market_action:view:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }

    public Specification<MarketAction> editMarketAction() {
        return new Specification<MarketAction>() {
            @Override
            public Predicate toPredicate(Root<MarketAction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("market_action:edit:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("market_action:edit:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("market_action:edit:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("market_action:edit:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("market_action:edit:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }

    public Specification<Leads> listLeads() {
        return new Specification<Leads>() {
            @Override
            public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("leads:list:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("leads:list:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("leads:list:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("leads:list:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("leads:list:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }

    public Specification<Leads> viewLeads() {
        return new Specification<Leads>() {
            @Override
            public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("leads:view:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("leads:view:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("leads:view:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("leads:view:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("leads:view:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }

    public Specification<Leads> editLeads() {
        return new Specification<Leads>() {
            @Override
            public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("leads:edit:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("leads:edit:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("leads:edit:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("leads:edit:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("leads:edit:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }

    public Specification<Opportunity> listOpportunity(){
        return new Specification<Opportunity>() {
            @Override
            public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("opportunity:list:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("opportunity:list:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("opportunity:list:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("opportunity:list:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("opportunity:list:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }
    public Specification<Opportunity> viewOpportunity() {
        return new Specification<Opportunity>() {
            @Override
            public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("opportunity:view:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("opportunity:view:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("opportunity:view:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("opportunity:view:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("opportunity:view:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }
    public Specification<Opportunity> editOpportunity() {
        return new Specification<Opportunity>() {
            @Override
            public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                Subject curSubject = SecurityUtils.getCurrentSubject();
                User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                if (curSubject.isPermitted("opportunity:edit:WHOLE")) {
                    return null;
                } else if (curSubject.isPermitted("opportunity:edit:BELONGANDLOW")) {
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return root.get("department").in(units);
                } else if (curSubject.isPermitted("opportunity:edit:BELONG")) {
                    Unit belongUnit = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    return cb.equal(root.get("department"), belongUnit);
                } else if (curSubject.isPermitted("opportunity:edit:SELFANDLOW")) {
                    List<Staff> selfAndDescendants = organizationService.getSelfAndDescendantStaff(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    List<User> users = userService.transStaffsToUsers(selfAndDescendants);
                    return root.get("owner").in(users);
                } else if (curSubject.isPermitted("opportunity:edit:SELF")) {
                    return cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
            }
        };
    }


    @Autowired
    public void setOrganizationService(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
