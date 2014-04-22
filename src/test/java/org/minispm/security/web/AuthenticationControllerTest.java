package org.minispm.security.web;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.minispm.utils.AbstractControllerTests;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.Repeat;
import org.springframework.test.annotation.Timed;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.junit.Assert.*;

/**
 * Created by shibaoxu on 14-3-27.
 */
public class AuthenticationControllerTest extends AbstractControllerTests {

    @Override
    @Before
    public void setup(){
        assertNotNull(shiroFilter);
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext).addFilter(shiroFilter).build();
    }
    @Test
    public void getLoginForm() throws Exception{
        ResultActions actions = mockMvc.perform(get("/login").accept("text/html"));
        actions.andDo(print());
        actions.andExpect(status().isOk());
        actions.andExpect(view().name("security/login"));
        actions.andExpect(forwardedUrl("/views/security/login.jsp"));
    }

    @Test
    public void postLoginForm() throws Exception{
        ResultActions actions = mockMvc.perform(post("/login").param("username", "12039").param("password","shibaoxu!@#"));
        actions.andDo(print());
        actions.andExpect(status().is3xxRedirection());
    }
}
