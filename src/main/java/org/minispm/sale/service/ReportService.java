package org.minispm.sale.service;

import org.minispm.sale.dao.ReportDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.DocumentException;

import java.io.FileOutputStream;
import java.util.Date;
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

    public List getSaleActivityReport(String style, String period) {
        return reportDao.saleActivity(style, period);
    }

    public List getCustomerActivityReport(String style, String period) {
        return reportDao.customerActivity(style, period);
    }

    public List getLeadsActivity(String period) {
        return reportDao.leadsActivity(period);
    }

    public List getCorpseLeads() {
        return reportDao.corpse();
    }

    public List getNewLeads() {
        return reportDao.newLeads();
    }

    public List getNewOpportunity() {
        return reportDao.newOpportunity();
    }

    public List getClosedLeads() {
        return reportDao.closedLeads();
    }

    public void createWeekReport(Date startDate, Date endDate, String format) throws com.itextpdf.text.DocumentException{
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        try {
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("ITextTest.pdf"));
        }catch (com.itextpdf.text.DocumentException e){
            System.out.println("exception");
        }
        catch (Exception ex) {
            System.out.println("exception");
        }

        document.open();
        document.add(new Paragraph("Some more text on the first page with different color and font type."));
        document.close();
    }

    @Autowired
    public void setReportDao(ReportDao reportDao) {
        this.reportDao = reportDao;
    }
}
