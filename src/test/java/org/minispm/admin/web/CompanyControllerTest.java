package org.minispm.admin.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;
import org.minispm.utils.AbstractControllerTests;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;

import javax.xml.transform.Result;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


/**
 * Created by shibaoxu on 14-4-7.
 */
public class CompanyControllerTest extends AbstractControllerTests {

    @Test
    public void getListPageTest() throws Exception {
        testTemplateMethod(HTTP_GET, "/admin/companies", HttpStatus.OK, "admin/companyList", "/views/admin/companyList.jsp");
    }

    @Test
    public void getCompanyUpdateFormTest() throws Exception {
        testTemplateMethod(HTTP_GET, "/admin/companies/1/edit", HttpStatus.OK, "admin/company", "/views/admin/company.jsp");
    }

    @Test
    public void getCompanyCreateFormTest() throws Exception {
        testTemplateMethod(HTTP_GET, "/admin/companies/new", HttpStatus.OK, "admin/company", "/views/admin/company.jsp");
    }

    @Test
    public void updateCompanyTest() throws Exception {
        MockHttpServletRequestBuilder requestBuilder = put("/admin/companies/1/edit").accept(MediaType.TEXT_HTML);
        requestBuilder.param("id", "1").param("name", "上海新致软件");
        ResultActions actions = mockMvc.perform(requestBuilder);
        actions.andDo(print());
        actions.andExpect(status().is3xxRedirection());
        actions.andExpect(view().name("redirect:/admin/companies"));
        actions.andExpect(forwardedUrl(null));
    }

    @Test
    public void CreateCompanyTest() throws Exception {
        MockHttpServletRequestBuilder requestBuilder = post("/admin/companies/new").accept(MediaType.TEXT_HTML);
        requestBuilder.param("name", "上海新致软件");
        ResultActions actions = mockMvc.perform(requestBuilder);
        actions.andDo(print());
        actions.andExpect(status().is3xxRedirection());
        actions.andExpect(view().name("redirect:/admin/companies"));
        actions.andExpect(forwardedUrl(null));
    }


    @Test
    public void deleteCompanyTest() throws Exception{
        testTemplateMethod(HTTP_DELETE, "/admin/companies/1/delete", HttpStatus.valueOf(302), "redirect:/admin/companies", null);
    }

}
