package org.minispm.util;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

/**
 * User: shibaoxu
 * Date: 12-12-2
 * Time: 下午9:19
 */
//@ContextConfiguration("classpath:applicationContext.xml")
@ContextConfiguration("classpath:applicationContext.xml")
public abstract class SpringTransactionalTestCase extends AbstractTransactionalJUnit4SpringContextTests {
}
