package org.minispm.sale.web;

import org.minispm.sale.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-5-17
 * Time: 上午10:36
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ReportController {
    private ReportService reportService;

    @RequestMapping("/sale/")
    public String overviewReport(){
        return "";
    }

    @RequestMapping(value = "/sale/report/portlet/saleActivity/{style}/{period}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List getSaleActivityReportJson(@PathVariable String style,@PathVariable String period){
        return reportService.getSaleActivityReport(style, period);
    }

    @Autowired
    public void setReportService(ReportService reportService) {
        this.reportService = reportService;
    }
}
