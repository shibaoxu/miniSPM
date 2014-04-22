package org.minispm.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.mgt.*;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Created by shibaoxu on 14-3-27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextHierarchy({
        @ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml","classpath:/spring/applicationContext-shiro.xml"}),
        @ContextConfiguration(locations = "classpath:/spring/spring-mvc.xml")
})
@ActiveProfiles("dev")
public abstract class AbstractControllerTests extends AbstractTransactionalJUnit4SpringContextTests {
    public final static String HTTP_GET = "HTTP_GET";
    public final static String HTTP_POST = "HTTP_POST";
    public final static String HTTP_PUT="HTTP_PUT";
    public final static String HTTP_DELETE="HTTP_DELETE";

    @Autowired
    protected WebApplicationContext webApplicationContext;

    @Autowired
    protected ApplicationContext applicationContext;

    @Autowired
    protected AbstractShiroFilter shiroFilter;

    protected MockMvc mockMvc;

    @Before
    public void setup(){
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).build();
    }

    protected ResultActions testTemplateMethod(String httpMethod, String url, HttpStatus expectedStatus, String expectedViewName, String expectedForwardURL) throws Exception{
        ResultActions actions = null;
        if (StringUtils.equalsIgnoreCase(httpMethod, HTTP_GET)){
            actions = mockMvc.perform(get(url).accept(MediaType.TEXT_HTML));
        }else if(StringUtils.equalsIgnoreCase(httpMethod, HTTP_POST)){
            actions = mockMvc.perform(post(url).accept(MediaType.TEXT_HTML));
        }else if(StringUtils.equalsIgnoreCase(httpMethod, HTTP_PUT)){
            actions = mockMvc.perform(put(url).accept(MediaType.TEXT_HTML));
        }else if(StringUtils.equalsIgnoreCase(httpMethod, HTTP_DELETE)){
            actions = mockMvc.perform(delete(url).accept(MediaType.TEXT_HTML));
        }else{
            throw new RuntimeException("http method [" + httpMethod + "] is not supported!");
        }
        actions.andDo(print());
        actions.andExpect(status().is(expectedStatus.value()));
        actions.andExpect(view().name(expectedViewName));
        actions.andExpect(forwardedUrl(expectedForwardURL));
        return actions;
    }
}
