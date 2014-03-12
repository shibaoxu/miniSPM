package org.minispm.report;

import org.junit.Test;
import org.minispm.sale.service.ReportService;
import org.minispm.util.SpringTransactionalTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 14-2-27
 * Time: 下午5:20
 * To change this template use File | Settings | File Templates.
 */
@ActiveProfiles("dev")
public class ReportTest extends SpringTransactionalTestCase {

    @Autowired
    private ReportService reportService;
    @Test
    public void weekReport() throws IOException {

        File newFile = new File("./test.txt");
        if(!newFile.exists()){
            newFile.createNewFile();
            FileOutputStream fos = new FileOutputStream(newFile);
            PrintWriter pw = new PrintWriter(fos);
            pw.append("Hello world!");
            pw.flush();;
            pw.close();
            fos.flush();
            fos.close();

        }

        List leads = reportService.getNewLeads();
        System.out.println("============" + leads.size());

    }
}
