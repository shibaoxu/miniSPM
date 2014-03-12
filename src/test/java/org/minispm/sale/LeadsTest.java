package org.minispm.sale;

import org.junit.Test;
import org.minispm.sale.service.LeadsService;
import org.minispm.util.SpringTransactionalTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;

/**
* Created with IntelliJ IDEA.
* User: shibaoxu
* Date: 13-3-17
* Time: 下午2:31
* To change this template use File | Settings | File Templates.
*/
@ActiveProfiles("dev")
public class LeadsTest extends SpringTransactionalTestCase {

    @Autowired
    private LeadsService leadsService;

    @Test
    public void testConvert(){
    }
}
