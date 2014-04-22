package org.minispm.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.*;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.SubjectThreadState;
import org.apache.shiro.util.LifecycleUtils;
import org.apache.shiro.util.ThreadState;
import org.junit.After;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.*;

/**
 * Created by shibaoxu on 14-4-1.
 */
@ContextConfiguration({"classpath:spring/applicationContext.xml", "classpath:/spring/applicationContext-shiro-test.xml"})
public abstract class AbstractServiceTestWithShiro extends AbstractServiceTests {
    private static ThreadState subjectThreadState;
    @Autowired
    private DefaultSecurityManager securityManager;

    protected void login(String userName, String password){
        assertTrue("userName can not be empty or null.", !StringUtils.isBlank(userName));
        assertTrue("password can not be empty or null.", !StringUtils.isBlank(password));
        setSecurityManager(securityManager);
        Subject subject = SecurityUtils.getSubject();
        subject.login(new UsernamePasswordToken(userName, password));
    }

    private void setSubject(Subject subject){
        doClearSubject();
        createThreadState(subject).bind();
    }

    private Subject getSubject(){
        return SecurityUtils.getSubject();
    }

    private ThreadState createThreadState(Subject subject){
        return new SubjectThreadState(subject);
    }

    private static void setSecurityManager(SecurityManager securityManager){
        SecurityUtils.setSecurityManager(securityManager);
    }

    private SecurityManager getSecurityManager(){
        return SecurityUtils.getSecurityManager();
    }

    private void doClearSubject(){
        if(subjectThreadState != null){
            subjectThreadState.clear();
            subjectThreadState = null;
        }
    }

    @After
    public void tearDown(){
        SecurityUtils.getSubject().logout();
//        doClearSubject();
//        try{
//            SecurityManager securityManager = getSecurityManager();
//            LifecycleUtils.destroy(securityManager);
//        } catch (UnavailableSecurityManagerException e){
//
//        }
//        setSecurityManager(null);
    }
}
