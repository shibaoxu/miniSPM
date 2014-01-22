package org.minispm.sale.service;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.minispm.sale.dao.OpportunityDao;
import org.minispm.sale.entity.LeadsStatus;
import org.minispm.sale.entity.Opportunity;
import org.minispm.security.utils.AuthorizationException;
import org.minispm.security.utils.SecurityUtils;
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
public class OpportunityService extends LeadsBaseService {
    private OpportunityDao opportunityDao;
    private SalePermissionFilterService salePermissionFilterService;
    private SpecificationBuilder specificationBuilder;

    @RequiresPermissions("opportunity:list:*")
    public Page<Opportunity> findAll(int pageNumber, String condition, boolean filterSelf, boolean filterClosed) {
//        return opportunityDao.findAll(specificationBuilder.<Opportunity>build("opportunity","list","name",condition), buildPageRequest(pageNumber));
        return opportunityDao.findAll(packagingSpecification(condition, filterSelf, filterClosed), buildPageRequest(pageNumber));
//        return leadsDao.findAll(this.packagingSpecification(condition, filterSelf, filterClosed), buildPageRequest(pageNumber));
    }

    @RequiresPermissions("opportunity:view:*")
    public Opportunity findByIdView(final String id) {
        Opportunity opportunity =  opportunityDao.findOne(specificationBuilder.<Opportunity>build("opportunity","view",id));
        if (null == opportunity){
            throw new AuthorizationException("你没有权限查看该销售机会,或者你所指定的销售机会不存在!");
        }else{
            return opportunity;
        }
    }
    @RequiresPermissions("opportunity:close:*")
    public Opportunity findByIdClose(String id){
        Opportunity opportunity = opportunityDao.findOne(specificationBuilder.<Opportunity>build("opportunity","close",id));
        if(null == opportunity){
            throw new AuthorizationException("你没有权限关闭该销售线索，或者你所指定的销售线索不存在!");
        }else{
            return opportunity;
        }
    }
    @RequiresPermissions("opportunity:close:*")
    @Override
    @Transactional(readOnly = false)
    public void close(String leadsBaseId, String closedReasonId, String closedDetail) {
        if(null == opportunityDao.findOne(specificationBuilder.<Opportunity>build("opportunity","close",leadsBaseId))){
            throw new AuthorizationException("你没有权限关闭该销售机会，或者你所指定的销售机会不存在!");
        }
        super.close(leadsBaseId, closedReasonId, closedDetail);
    }

    public Opportunity findByIdEdit(String id){
        Opportunity opportunity =  opportunityDao.findOne(specificationBuilder.<Opportunity>build("opportunity","edit",id));
        if (null == opportunity){
            throw new AuthorizationException("你没有权限查看该销售机会,或者你所指定的销售机会不存在!");
        }else{
            return opportunity;
        }
    }

    private PageRequest buildPageRequest(int pageNumber) {
        return new PageRequest(pageNumber - 1, 10, new Sort(Sort.Direction.DESC, "lastModifiedDate"));
    }

    private Specification<Opportunity> buildFilterSpecification(final boolean filterSelf, final boolean filterClosed){
        if(!filterSelf && filterClosed)
            return null;

        return new Specification<Opportunity>() {
            @Override
            public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate pSelf = null;
                Predicate pClosed = null;
                if(filterSelf){
                    String userId = SecurityUtils.getCurrentShiroUser().getId();
                    pSelf = cb.equal(root.get("owner").get("id"), userId);
                }
                if(!filterClosed){
                    pClosed = cb.equal(root.get("status"), LeadsStatus.OPENING);
                }
                if(pSelf != null &&  pClosed != null){
                    return cb.and(pSelf, pClosed);
                }
                if(pSelf != null && pClosed == null){
                    return pSelf;
                }
                if(pSelf == null && pClosed != null){
                    return pClosed;
                }
                return null;
            }
        };
    }

    private Specification<Opportunity> packagingSpecification(final String condition, final boolean filterSelf, final boolean filterClosed){

        return new Specification<Opportunity>() {
            @Override
            public Predicate toPredicate(Root<Opportunity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Specification<Opportunity> authorizeSpecification = specificationBuilder.<Opportunity>build("opportunity", "list","name", condition);
                Specification<Opportunity> filterSpecification = buildFilterSpecification(filterSelf, filterClosed);
                if(filterSpecification == null){
                    return authorizeSpecification.toPredicate(root, query, cb);
                }else{
                    return cb.and(authorizeSpecification.toPredicate(root,query,cb), filterSpecification.toPredicate(root, query,cb));
                }
            }
        };
//        return authorizeSpecification;
    }
    @Autowired
    public void setOpportunityDao(OpportunityDao opportunityDao) {
        this.opportunityDao = opportunityDao;
    }

    @Autowired
    public void setSalePermissionFilterService(SalePermissionFilterService salePermissionFilterService) {
        this.salePermissionFilterService = salePermissionFilterService;
    }

    @Autowired
    public void setSpecificationBuilder(SpecificationBuilder specificationBuilder) {
        this.specificationBuilder = specificationBuilder;
    }
}
