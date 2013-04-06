package org.minispm.sale.service;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.minispm.sale.dao.OpportunityDao;
import org.minispm.sale.entity.Opportunity;
import org.minispm.security.utils.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-3-14
 * Time: 下午1:26
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(readOnly = true)
public class OpportunityService {
    private OpportunityDao opportunityDao;
    private SalePermissionFilterService salePermissionFilterService;

    public Page<Opportunity> findAll(int pageNumber, String condition) {
        return opportunityDao.findAll(buildListSpecification(condition), buildPageRequest(pageNumber));
    }

    @RequiresPermissions(logical = Logical.OR, value = {"opportunity:list:SELF", "opportunity:list:SELFANDLOW", "opportunity:list:BELONG", "opportunity:list:BELONGANDLOW", "opportunity:list:WHOLE"})
    public Opportunity findByIdView(final String id) {
        Opportunity opportunity =  opportunityDao.findOne(
            new Specification<Opportunity>() {
                @Override
                public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                    return cb.and(cb.equal(root.get("id"), id), salePermissionFilterService.viewOpportunity().toPredicate(root, query,cb));  //To change body of implemented methods use File | Settings | File Templates.
                }
            }
        );
        if (null == opportunity){
            throw new AuthorizationException("你没有权限编辑该销售机会或者你所指定的销售机会不存在!");
        }else{
            return opportunity;
        }
    }

    private PageRequest buildPageRequest(int pageNumber) {
        return new PageRequest(pageNumber - 1, 10, new Sort(Sort.Direction.DESC, "lastModifiedDate"));
    }

    private Specification<Opportunity> buildListSpecification(final String condition) {
        final Specification<Opportunity> listSpecification = salePermissionFilterService.listOpportunity();
        return new Specification<Opportunity>() {
            @Override
            public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                String likePattern = "%" + condition + "%";
                Predicate likePredicate = cb.or(cb.like(root.<String>get("name"), likePattern), cb.like(root.<String>get("des"), likePattern));
                return cb.and(likePredicate, listSpecification.toPredicate(root, query, cb));
            }
        };
    }

    @Autowired
    public void setOpportunityDao(OpportunityDao opportunityDao) {
        this.opportunityDao = opportunityDao;
    }

    @Autowired
    public void setSalePermissionFilterService(SalePermissionFilterService salePermissionFilterService) {
        this.salePermissionFilterService = salePermissionFilterService;
    }
}
