package org.minispm.sale.service;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.minispm.sale.entity.Leads;
import org.minispm.core.utils.DateUtils;
import org.minispm.sale.dao.ActionDao;
import org.minispm.sale.dao.LeadsDao;
import org.minispm.sale.entity.Action;
import org.minispm.sale.entity.LeadsStatus;
import org.minispm.security.dao.UserDao;
import org.minispm.security.entity.User;
import org.minispm.security.service.ShiroDbRealm;
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
import java.util.Date;

/**
 * User: shibaoxu
 * Date: 12-12-16
 * Time: 下午6:30
 */
@Service
@Transactional(readOnly = true)
public class LeadsService extends LeadsBaseService {
    @Autowired
    private LeadsDao leadsDao;
    @Autowired
    private ActionDao actionDao;
    @Autowired
    private SpecificationBuilder specificationBuilder;
    @Autowired
    private UserDao userDao;

    @RequiresPermissions("leads:list:*")
    public Page<Leads> findAll(int pageNumber, String condition, boolean filterSelf, boolean filterClosed) {
//        return leadsDao.findAll(specificationBuilder.<Leads>build("leads", "list","name", condition), buildPageRequest(pageNumber));
        return leadsDao.findAll(this.packagingSpecification(condition, filterSelf, filterClosed), buildPageRequest(pageNumber));
    }

    @RequiresPermissions("leads:view:*")
    public Leads findByIdView(final String id) {
        Leads leads = leadsDao.findOne(specificationBuilder.<Leads>build("leads","view",id));
        if(null == leads){
            throw new AuthorizationException("你没有权限查看该销售线索，或者你所指定的销售线索不存在!");
        }else {
            return leads;
        }
    }

    @RequiresPermissions("leads:edit:*")
    public Leads findByIdEdit(final String id) {
        Leads leads = leadsDao.findOne(specificationBuilder.<Leads>build("leads","edit",id));
        if(null == leads){
            throw new AuthorizationException("你没有权限编辑该销售线索，或者你所指定的销售线索不存在!");
        }else{
            return leads;
        }
    }

    @RequiresPermissions("leads:close:*")
    public Leads findByIdClose(String id){
        Leads leads = leadsDao.findOne(specificationBuilder.<Leads>build("leads","close",id));
        if(null == leads){
            throw new AuthorizationException("你没有权限关闭该销售线索，或者你所指定的销售线索不存在!");
        }else{
            return leads;
        }
    }

    @RequiresPermissions("leads:convertToOpportunity:*")
    public Leads findByIdConvert(String id){
        Leads leads = leadsDao.findOne(specificationBuilder.<Leads>build("leads","convertToOpportunity",id));
        if(null == leads){
            throw new AuthorizationException("你没有权限把该销售线索转化成销售机会，或者你所指定的销售线索不存在!");
        }else{
            return leads;
        }
    }

    @Transactional(readOnly = false)
    @RequiresPermissions("Leads:create:*")
    public Leads save(Leads Leads) {
        if (StringUtils.isBlank(Leads.getId())) {
            addCreateAction(Leads);
        }
        return leadsDao.save(Leads);
    }

    @Transactional(readOnly = false)
    @RequiresPermissions("leads:edit:*")
    public Leads update(Leads Leads) {
        findByIdEdit(Leads.getId());
        return leadsDao.save(Leads);
    }


    @RequiresPermissions({"leads:convertToOpportunity:*"})
    @Transactional(readOnly = false)
    public void convertToOpportunity(String id, Date planDealDate, double lowAmount, double highAmount){
        findByIdConvert(id);
        addConvertMsg(id);
        leadsDao.convertToOpportunity(id, planDealDate, lowAmount, highAmount);
    }

    @RequiresPermissions("leads:close:*")
    @Override
    @Transactional(readOnly = false)
    public void close(String leadsBaseId, String closedReasonId, String closedDetail) {
        if(null == leadsDao.findOne(specificationBuilder.<Leads>build("leads","close",leadsBaseId))){
           throw new AuthorizationException("你没有权限关闭该销售线索，或者你所指定的销售线索不存在!");
        }
        super.close(leadsBaseId, closedReasonId, closedDetail);
    }

    private Specification<Leads> buildFilterSpecification(final boolean filterSelf, final boolean filterClosed){
        if(!filterSelf && filterClosed)
            return null;

        return new Specification<Leads>() {
            @Override
            public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
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

    private Specification<Leads> packagingSpecification(final String condition, final boolean filterSelf, final boolean filterClosed){

        return new Specification<Leads>() {
            @Override
            public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Specification<Leads> authorizeSpecification = specificationBuilder.<Leads>build("leads", "list","name", condition);
                Specification<Leads> filterSpecification = buildFilterSpecification(filterSelf, filterClosed);
                if(filterSpecification == null){
                    return authorizeSpecification.toPredicate(root, query, cb);
                }else{
                    return cb.and(authorizeSpecification.toPredicate(root,query,cb), filterSpecification.toPredicate(root, query,cb));
                }
            }
        };
//        return authorizeSpecification;
    }
    private void addCreateAction(Leads leads){
        Action action = new Action(Action.CREATED);
        action.setOwner(userDao.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName()));
        leads.addAction(action);
        leads.setLastInfo(action.buildActionInfo());
        leads.setLastModifiedDate(new Date());
    }

    private void addConvertMsg(String id){
        Action action = new Action(Action.CONVERT);
        action.setOwner(userDao.findByJobNumber(SecurityUtils.getCurrentShiroUser().getLoginName()));
        Leads leads = leadsDao.findOne(id);
        leads.addAction(action);
        leads.setLastModifiedDate(new Date());
        leads.setLastInfo(DateUtils.formatDate(new Date()) + ":转成销售机会");
        leads.setCreatedDate(new Date());  //销售机会的创建日期更改成转化时间
        leadsDao.save(leads);
    }

    private PageRequest buildPageRequest(int pageNumber){
        return new PageRequest(pageNumber - 1, 10 , new Sort(Sort.Direction.DESC, "lastModifiedDate"));
    }

}
