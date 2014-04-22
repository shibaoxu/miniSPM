package org.minispm.sale.service;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.subject.Subject;
import org.minispm.admin.organization.entity.AccountabilityType;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.admin.organization.entity.Unit;
import org.minispm.admin.organization.service.OrganizationService;
import org.minispm.core.persistence.IdEntity;
import org.minispm.security.entity.User;
import org.minispm.security.service.UserService;
import org.minispm.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-10-31
 * Time: 上午9:04
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(readOnly = true)
public class SpecificationBuilder {
    @Autowired
    private UserService userService;
    @Autowired
    private OrganizationService organizationService;

    public <T extends IdEntity> Specification<T> build(final String domainName, final String operationName, final String objId){
        final Specification<T> specification = this.<T>build(domainName, operationName);
        return new Specification<T>() {
            @Override
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                if(StringUtils.isNotBlank(objId)){
                    if(specification.toPredicate(root, query, cb) != null){
                        return cb.and(specification.toPredicate(root, query, cb), cb.equal(root.get("id"), objId));
                    }else{
                        return cb.equal(root.get("id"), objId);
                    }
                }else{
                    return specification.toPredicate(root, query, cb);
                }
            }
        };
    }
    public <T extends IdEntity> Specification<T> build(final String domainName, final String operationName, final String filterField, final String filterString){
        final Specification<T> specification = this.<T>build(domainName, operationName);
        return new Specification<T>() {
            @Override
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                if (specification.toPredicate(root, query, cb) == null) {
                    return cb.like(root.<String>get(filterField), "%" + filterString + "%");
                } else {
                    return cb.and(cb.like(root.<String>get(filterField), "%" + filterString + "%"), specification.toPredicate(root, query, cb));
                }
            }
        };
    }

    public <T extends IdEntity> Specification<T> build(final String domainName, final String operationName){
        final Subject curSubject = SecurityUtils.getCurrentSubject();
        final String domainAndOperation = domainName + ":" + operationName;
        return new Specification<T>() {
            @Override
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = null;
                if (curSubject.isPermitted(domainAndOperation + ":ORG")) {
                    predicate = null;
                } else if (curSubject.isPermitted(domainAndOperation + ":DEPTANDSUB")) {//ok
                    User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                    List<Unit> units = organizationService.getBelongAndDescendantOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    predicate =  root.get("department").in(units);
                } else if (curSubject.isPermitted(domainAndOperation + ":DEPT")) {//OK
                    User user = userService.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName());
                    Unit dept = organizationService.getBelongOrg(user.getStaff().getId(), AccountabilityType.SALE_ORG);
                    predicate =  cb.equal(root.get("department"), dept);
                } else if (curSubject.isPermitted(domainAndOperation + ":SELF")) {//OK
                    predicate = cb.equal(root.get("owner").get("id"), SecurityUtils.getCurrentShiroUser().getId());
                } else {
                    throw new RuntimeException("你的权限非系统设定");
                }
                return predicate;
            }
        };
    }

}
