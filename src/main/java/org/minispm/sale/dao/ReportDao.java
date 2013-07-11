package org.minispm.sale.dao;

import org.apache.commons.lang3.StringUtils;
import org.minispm.core.utils.DateUtils;
import org.minispm.core.utils.Exceptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import javax.persistence.criteria.CriteriaBuilder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-5-17
 * Time: 下午3:27
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class ReportDao {
    @PersistenceContext
    private EntityManager em;
    public final static String STYLE_RED = "RED";
    public final static String STYLE_BLACK = "BLACK";
    public final static String PERIOD_WEEK = "WEEK";
    public final static String PERIOD_MONTH = "MONTH";
    public final static String PERIOD_ALL = "ALL";

    public List saleActivity(String style, String period){
        String sql = "select user.name, count(*) cnt from \n" +
                "(select id, user_id from ila_action where created_date > :startDate\n" +
                "union\n" +
                "select id, user_id from ila_market_action  where created_date > :startDate) a\n" +
                "inner join ila_user user where user.id = a.user_id\n" +
                "group by user_id\n";
        Date begin = null;

        if(StringUtils.equals(style, ReportDao.STYLE_BLACK)){
            sql = sql + "order by cnt asc";
        }else if(StringUtils.equals(style, ReportDao.STYLE_RED)){
            sql = sql + "order by cnt desc";
        }else{
            throw Exceptions.createArgumentException("");
        }

        if(StringUtils.equals(period, ReportDao.PERIOD_MONTH)){
            begin = DateUtils.getRecentlyMonth();
        }else if(StringUtils.equals(period, ReportDao.PERIOD_WEEK)){
            begin = DateUtils.getRecentlyWeek();
        }else if(StringUtils.equals(period, ReportDao.PERIOD_ALL)){
            begin = DateUtils.getAncient();
        }else{
            throw Exceptions.createArgumentException("");
        }
        Query query = em.createNativeQuery(sql);

        query.setParameter("startDate", begin, TemporalType.DATE);
        query.setMaxResults(8);
        return query.getResultList();
    }

    public List customerActivity(String style, String period){
        String sql = "select un.name, count(*) cnt from " +
        "(select a.id, b.name  from ila_market_action a " +
        "inner join ila_customer b on a.customer_id = b.id " +
        "where a.created_date > :startDate " +
        "union " +
        "select c.id, f.name  from ila_action c " +
        "inner join ila_leads d on c.leads_id = d.id " +
        "inner join ila_customer f on d.customer_id = f.id " +
        "where c.action_type_id != 'system' and c.created_date > :startDate" +
        ") un " +
        "group by name\n";

        Date begin = null;

        if(StringUtils.equals(style, ReportDao.STYLE_BLACK)){
            sql = sql + "order by cnt asc";
        }else if(StringUtils.equals(style, ReportDao.STYLE_RED)){
            sql = sql + "order by cnt desc";
        }else{
            throw Exceptions.createArgumentException("");
        }

        if(StringUtils.equals(period, ReportDao.PERIOD_MONTH)){
            begin = DateUtils.getRecentlyMonth();
        }else if(StringUtils.equals(period, ReportDao.PERIOD_WEEK)){
            begin = DateUtils.getRecentlyWeek();
        }else if(StringUtils.equals(period, ReportDao.PERIOD_ALL)){
            begin = DateUtils.getAncient();
        }else{
            throw Exceptions.createArgumentException("");
        }
        Query query = em.createNativeQuery(sql);

        query.setParameter("startDate", begin, TemporalType.DATE);
        query.setMaxResults(8);
        return query.getResultList();

    }

    public List leadsActivity(String period){
        String sql = "select  c.name c_name, a.name l_name, count(b.id) cnt from ila_leads a\n" +
                "inner join ila_action b on a.id = b.leads_id and b.created_date > :startDate\n" +
                "inner join ila_customer c on a.customer_id = c.id " +
                "where a.status = '0' \n" +
                "group by l_name, c_name\n" +
                "order by cnt desc";
        Date begin = null;

        if(StringUtils.equals(period, ReportDao.PERIOD_MONTH)){
            begin = DateUtils.getRecentlyMonth();
        }else if(StringUtils.equals(period, ReportDao.PERIOD_WEEK)){
            begin = DateUtils.getRecentlyWeek();
        }else if(StringUtils.equals(period, ReportDao.PERIOD_ALL)){
            begin = DateUtils.getAncient();
        }else{
            throw Exceptions.createArgumentException("");
        }
        Query query = em.createNativeQuery(sql);

        query.setParameter("startDate", begin, TemporalType.DATE);
        query.setMaxResults(10);
        return query.getResultList();

    }
    public List corpse(){
        String sql = "select c.name c_name, a.name l_name, to_days(now()) - to_days(max(b.created_date)) days from ila_leads a " +
        "inner join ila_action b on a.id = b.leads_id and b.action_type_id != 'system' " +
        "inner join ila_customer c on a.customer_id = c.id " +
        "where a.status = '0' " +
        "group by l_name " +
        "having days >= 14 " +
        "order by days desc ";

        Query query = em.createNativeQuery(sql);
        query.setMaxResults(10);
        return query.getResultList();

    }

    public List newLeads(){
        String sql = "select b.name c_name, a.name l_name, a.created_date from ila_leads a\n" +
                "inner join ila_customer b on a.customer_id = b.id\n" +
                "where a.created_date > :startDate and a.opportunity = '0'\n" +
                "order by a.created_date desc";
        Date begin = DateUtils.getRecentlyMonth();
        Query query = em.createNativeQuery(sql);

        query.setParameter("startDate", begin, TemporalType.DATE);
        return query.getResultList();
    }

    public List newOpportunity(){
        String sql = "select b.name c_name, a.name l_name, a.created_date from ila_leads a\n" +
                "inner join ila_customer b on a.customer_id = b.id\n" +
                "where a.created_date > :startDate and a.opportunity = '1'\n" +
                "order by a.created_date desc";
        Date begin = DateUtils.getRecentlyMonth();
        Query query = em.createNativeQuery(sql);

        query.setParameter("startDate", begin, TemporalType.DATE);
        return query.getResultList();
    }

    public List closedLeads(){
        String sql = "select a.name, b.name, a.close_date  from ila_leads a \n" +
                "inner join ila_closed_reason b on a.closed_reason_id = b.id\n" +
                "where a.status = '1' and a.close_date > :startDate\n" +
                "order by a.close_date desc";
        Date begin = DateUtils.getRecentlyMonth();
        Query query = em.createNativeQuery(sql);

        query.setParameter("startDate", begin, TemporalType.DATE);
        return query.getResultList();
    }
}
