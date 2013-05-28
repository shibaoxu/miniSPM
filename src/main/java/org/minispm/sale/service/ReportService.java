package org.minispm.sale.service;

import org.minispm.sale.dao.ReportDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-5-23
 * Time: 下午7:04
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(readOnly = true)
public class ReportService {
    private ReportDao reportDao;

    public List getSaleActivityReport(String style, String period){
        return reportDao.saleActivity(style, period);
    }

    @Autowired
    public void setReportDao(ReportDao reportDao) {
        this.reportDao = reportDao;
    }
}
