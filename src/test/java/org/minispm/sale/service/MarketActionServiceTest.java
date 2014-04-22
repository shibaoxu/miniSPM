package org.minispm.sale.service;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.minispm.sale.entity.MarketAction;
import org.minispm.security.entity.User;
import org.minispm.security.utils.ShiroUser;
import org.minispm.utils.AbstractServiceTestWithShiro;
import org.minispm.utils.AbstractServiceTests;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.test.context.ContextConfiguration;


/**
 * Created by shibaoxu on 14-3-28.
 */
public class MarketActionServiceTest extends AbstractServiceTestWithShiro {
    @Autowired
    private MarketActionService marketActionService;

    @Test
    public void getAllByDivisionManager(){
        login("12039","shibaoxu!@#");
        Page<MarketAction> page = marketActionService.getAll(1, "项目");
        int rows = jdbcTemplate.queryForObject("select count(*) from ila_market_action where brief like ?", Integer.class, "%项目%");
        assertEquals(page.getTotalElements(), rows);
        assertEquals(page.getSize(), 10);
    }

    @Test
    public void getAllBySales(){
        login("12395", "shibaoxu!@#");
        Page<MarketAction> page = marketActionService.getAll(1, "");
        int rows = jdbcTemplate.queryForObject("select count(*) from ila_market_action where brief like ? and user_id = ?", Integer.class, new Object[]{"%%", ((ShiroUser)SecurityUtils.getSubject().getPrincipal()).getId()});
        assertEquals(rows, page.getTotalElements());
    }

}
