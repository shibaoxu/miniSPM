package org.minispm.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.mgt.*;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.SubjectThreadState;
import org.apache.shiro.util.LifecycleUtils;
import org.apache.shiro.util.ThreadState;
import org.junit.After;
import org.junit.AfterClass;
import org.minispm.core.web.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Profile;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by shibaoxu on 14-3-27.
 */
@ContextConfiguration({"classpath:spring/applicationContext.xml"})
@ActiveProfiles("dev")
public abstract class AbstractServiceTests extends AbstractTransactionalJUnit4SpringContextTests {
    @PersistenceContext
    protected EntityManager entityManager;
}
