package org.minispm.sale.service;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.minispm.sale.entity.Leads;
import org.minispm.core.utils.DateUtils;
import org.minispm.sale.dao.ActionDao;
import org.minispm.sale.dao.LeadsDao;
import org.minispm.sale.entity.Action;
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
    private LeadsDao leadsDao;
    private ActionDao actionDao;
    private SalePermissionFilterService salePermissionFilterService;

    @RequiresPermissions(logical = Logical.OR, value = {"leads:list:SELF", "leads:list:SELFANDLOW", "leads:list:BELONG", "leads:list:BELONGANDLOW", "leads:list:WHOLE"})
    public Page<Leads> findAll(int pageNumber, String condition) {
        return leadsDao.findAll(buildListSpecification(condition), buildPageRequest(pageNumber));
    }

    @RequiresPermissions(logical = Logical.OR, value = {"leads:view:SELF", "leads:view:SELFANDLOW", "leads:view:BELONG", "leads:view:BELONGANDLOW", "leads:view:WHOLE"})
    public Leads findByIdView(final String id) {
        Leads Leads = leadsDao.findOne(
                new Specification<Leads>() {
                    @Override
                    public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                        return cb.and(cb.equal(root.get("id"), id), salePermissionFilterService.viewLeads().toPredicate(root, query, cb));
                    }
                });
        if(null == Leads){
            throw new AuthorizationException("你没有权限编辑该销售线索或者你所指定的销售线索不存在!");
        }else {
            return Leads;
        }
    }

    @RequiresPermissions(logical = Logical.OR, value = {"leads:edit:SELF", "leads:edit:SELFANDLOW", "leads:edit:BELONG", "leads:edit:BELONGANDLOW", "leads:edit:WHOLE"})
    public Leads findByIdEdit(final String id) {
        Leads Leads = leadsDao.findOne(
                new Specification<Leads>() {
                    @Override
                    public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                        return cb.and(cb.equal(root.get("id"), id), salePermissionFilterService.editLeads().toPredicate(root, query, cb));
                    }
                });
        if(null == Leads){
            throw new AuthorizationException("你没有权限编辑该销售线索或者你所指定的销售线索不存在!");
        }else{
            return Leads;
        }

    }

    @Transactional(readOnly = false)
    @RequiresPermissions("Leads:create:self")
    public Leads save(Leads Leads) {
        if (StringUtils.isBlank(Leads.getId())) {
            addCreateAction(Leads);
        }
        return leadsDao.save(Leads);
    }

    @Transactional(readOnly = false)
    public Leads update(Leads Leads) {
        findByIdEdit(Leads.getId());
        return leadsDao.save(Leads);
    }


    @RequiresPermissions({"leads:convertToOpportunity:WHOLE"})
    @Transactional(readOnly = false)
    public void convertToOpportunity(String id, Date planDealDate, double lowAmount, double highAmount){
        addConvertMsg(id);
        leadsDao.convertToOpportunity(id, planDealDate, lowAmount, highAmount);
    }

    private void addCreateAction(Leads leads){
        Action action = new Action(Action.CREATED);
        ShiroDbRealm.ShiroUser shiroUser = SecurityUtils.getCurrentShiroUser();
        User user = new User();
        user.setId(shiroUser.getId());
        action.setOwner(user);
        leads.addAction(action);
        leads.setLastInfo(action.buildActionInfo());
        leads.setLastModifiedDate(new Date());
    }

    private void addConvertMsg(String id){
        Action action = new Action(Action.CONVERT);
        ShiroDbRealm.ShiroUser shiroUser = SecurityUtils.getCurrentShiroUser();
        User user = new User();
        user.setId(shiroUser.getId());
        action.setOwner(user);
        Leads leads = leadsDao.findOne(id);
        leads.addAction(action);
        leads.setLastModifiedDate(new Date());
        leads.setLastInfo(DateUtils.formatDate(new Date()) + ":转成销售机会");
        leadsDao.save(leads);
    }

    private Specification<Leads> buildListSpecification(final String condition){
        final Specification<Leads> permissionSpecification = salePermissionFilterService.listLeads();
        return new Specification<Leads>() {
            @Override
            public Predicate toPredicate(Root<Leads> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                String likePattern = "%" + condition + "%";
                Predicate likePredicate = cb.or(cb.like(root.<String>get("name"), likePattern), cb.like(root.<String>get("des"), likePattern));
                return cb.and(likePredicate, permissionSpecification.toPredicate(root, query, cb));
            }
        };
    }

    private PageRequest buildPageRequest(int pageNumber){
        return new PageRequest(pageNumber - 1, 10 , new Sort(Sort.Direction.DESC, "lastModifiedDate"));
    }

    @Autowired
    public void setLeadsDao(LeadsDao leadsDao) {
        this.leadsDao = leadsDao;
    }

    @Autowired
    public void setSalePermissionFilterService(SalePermissionFilterService salePermissionFilterService) {
        this.salePermissionFilterService = salePermissionFilterService;
    }

    @Autowired
    public void setActionDao(ActionDao actionDao) {
        this.actionDao = actionDao;
    }
}
