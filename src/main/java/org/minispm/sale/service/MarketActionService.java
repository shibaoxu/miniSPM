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
    private SpecificationBuilder specificationBuilder;

    @RequiresPermissions("market_action:list:*")
    public Page<MarketAction> getAll(int pageNumber, String conditions) {
        return marketActionDao.findAll(specificationBuilder.<MarketAction>build("market_action","list","brief",conditions), buildPageRequest(pageNumber));
    }

    @RequiresPermissions("market_action:view:*")
    public MarketAction getByIdView(final String id) {
        MarketAction action = marketActionDao.findOne(specificationBuilder.<MarketAction>build("market_action","view",id));
        if (null == action) {
            throw new AuthorizationException("您没有权限查看此市场活动或者此市场活动不存在");
        } else {
            return action;
        }
    }

    @RequiresPermissions("market_action:edit:*")
    public MarketAction getByIdEdit(final String id) {
        MarketAction action = marketActionDao.findOne(specificationBuilder.<MarketAction>build("market_action","edit",id));
        if (null == action) {
            throw new AuthorizationException("您没有权限查看此市场活动或者此市场活动不存在");
        } else {
            return action;
        }
    }


    @RequiresPermissions("market_action:create:*")
    public void create(){

    }
    @Transactional(readOnly = false)
    @RequiresPermissions("market_action:create:*")
    public MarketAction save(MarketAction marketAction) {
        return marketActionDao.save(marketAction);
    }

    @Transactional(readOnly = false)
    @RequiresPermissions("market_action:edit:*")
    public MarketAction update(MarketAction marketAction) {
        getByIdEdit(marketAction.getId());
        return marketActionDao.save(marketAction);
    }

    private PageRequest buildPageRequest(int pageNumber) {
        return new PageRequest(pageNumber - 1, 10, new Sort(Sort.Direction.DESC, "eventDate"));
    }

    @Autowired
    public void setMarketActionDao(MarketActionDao marketActionDao) {
        this.marketActionDao = marketActionDao;
    }

    @Autowired
    public void setSpecificationBuilder(SpecificationBuilder specificationBuilder) {
        this.specificationBuilder = specificationBuilder;
    }
}
