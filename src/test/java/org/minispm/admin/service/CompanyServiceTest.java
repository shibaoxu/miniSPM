package org.minispm.admin.service;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.minispm.admin.organization.entity.Company;
import org.minispm.admin.organization.service.CompanyService;
import org.minispm.utils.AbstractServiceTests;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import static org.junit.Assert.*;

/**
 * Created by shibaoxu on 14-4-6.
 */
public class CompanyServiceTest extends AbstractServiceTests {

    @Autowired
    private CompanyService companyService;

    @Test
    public void getByIdTest(){
        Company company = companyService.findById("1");
        assertTrue(StringUtils.equalsIgnoreCase(company.getName(), "上海新致"));
    }

    @Test
    public void getByNameTest(){
        Company company = companyService.findByName("上海新致");
        assertTrue(StringUtils.equalsIgnoreCase(company.getId(), "1"));
    }

    @Test
    public void createTest(){
        Company company = new Company();
        company.setName("上海新致软件有限公司");
        Company result = companyService.save(company);
        assertTrue(!StringUtils.isBlank(result.getId()));
    }

    @Test
    public void updateTest(){
        Company company = companyService.findById("1");
        company.setName("上海新致软件有限公司");
        Company result = companyService.save(company);
        assertTrue(StringUtils.equalsIgnoreCase("上海新致软件有限公司", result.getName()));
    }

    @Test
    public void deleteTest(){
        Company company = new Company();
        company.setName("某某软件公司");
        Company result = companyService.save(company);
        entityManager.flush();
        assertEquals(2,countRowsInTable("ila_company"));
        companyService.removeById(result.getId());
        entityManager.flush();
        assertEquals(1,countRowsInTable("ila_company"));
    }

}
