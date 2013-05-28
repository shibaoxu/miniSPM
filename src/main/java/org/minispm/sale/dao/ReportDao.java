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
        query.setMaxResults(10);
        return query.getResultList();
    }

}
