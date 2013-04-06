package org.minispm.sale.service;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.minispm.sale.entity.MarketAction;
import org.minispm.sale.dao.MarketActionDao;
import org.minispm.security.utils.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;

/**
 * User: shibaoxu
 * Date: 13-1-21
 * Time: 下午6:04
 */
@Service
@Transactional(readOnly = true)
public class MarketActionService {
    private MarketActionDao marketActionDao;
    private SalePermissionFilterService salePermissionFilterService;

    @RequiresPermissions(logical = Logical.OR, value = {"market_action:list:SELF", "market_action:list:SELFANDLOW", "market_action:list:BELONG", "market_action:list:BELONGANDLOW", "market_action:list:WHOLE"})
    public Page<MarketAction> getAll(int pageNumber, String conditions) {
        return marketActionDao.findAll(buildListSpecification(conditions), buildPageRequest(pageNumber));
    }

    @RequiresPermissions(logical = Logical.OR, value = {"market_action:view:SELF", "market_action:view:SELFANDLOW", "market_action:view:BELONG", "market_action:view:BELONGANDLOW", "market_action:view:WHOLE"})
    public MarketAction getByIdView(final String id) {
        MarketAction action = marketActionDao.findOne(
                new Specification<MarketAction>() {
                    @Override
                    public Predicate toPredicate(Root<MarketAction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                        return cb.and(cb.equal(root.get("id"), id), salePermissionFilterService.viewMarketAction().toPredicate(root, query, cb));
                    }
                });
        if (null == action){
            throw new AuthorizationException("您没有权限查看此市场活动或者此市场活动不存在");
        }else {
            return action;
        }
    }

    @RequiresPermissions(logical = Logical.OR, value = {"market_action:edit:SELF", "market_action:edit:SELFANDLOW", "market_action:edit:BELONG", "market_action:edit:BELONGANDLOW", "market_action:edit:WHOLE"})
    public MarketAction getByIdEdit(final String id) {
        MarketAction action = marketActionDao.findOne(
                new Specification<MarketAction>() {
                    @Override
                    public Predicate toPredicate(Root<MarketAction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                        return cb.and(cb.equal(root.get("id"), id), salePermissionFilterService.editMarketAction().toPredicate(root, query, cb));
                    }
                });
        if (null == action){
            throw new AuthorizationException("您没有权限查看此市场活动或者此市场活动不存在");
        }else {
            return action;
        }
    }

    @Transactional(readOnly = false)
    @RequiresPermissions("market_action:create:self")
    public MarketAction save(MarketAction marketAction) {
        return marketActionDao.save(marketAction);
    }

    @Transactional(readOnly = false)
    public MarketAction update(MarketAction marketAction) {
        getByIdEdit(marketAction.getId());
        return marketActionDao.save(marketAction);
    }

    public MarketActionDao getMarketActionDao() {
        return marketActionDao;
    }

    private Specification<MarketAction> buildListSpecification(final String condition){
        final Specification<MarketAction> permissionSpecification = salePermissionFilterService.listMarketAction();
        return new Specification<MarketAction>() {
            @Override
            public Predicate toPredicate(Root<MarketAction> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                return cb.and(cb.like(root.<String>get("brief"), "%" + condition + "%"), permissionSpecification.toPredicate(root, query, cb));
            }
        };
    }

    private PageRequest buildPageRequest(int pageNumber){
        return new PageRequest(pageNumber - 1, 10 , new Sort(Sort.Direction.DESC, "eventDate"));
    }

    @Autowired
    public void setMarketActionDao(MarketActionDao marketActionDao) {
        this.marketActionDao = marketActionDao;
    }

    @Autowired
    public void setSalePermissionFilterService(SalePermissionFilterService salePermissionFilterService) {
        this.salePermissionFilterService = salePermissionFilterService;
    }
}
