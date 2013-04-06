package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.CompanyDao;
import org.minispm.admin.organization.entity.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class CompanyService {
    private CompanyDao companyDao;

    public CompanyService() {
    }

    @Transactional(readOnly = false)
    public Company save(Company company) {
        return companyDao.save(company);
    }

    public Company findById(String id) {
        return companyDao.findOne(id);
    }

    public Company findByName(String name) {
        return companyDao.findByName(name);
    }

    public List<Company> findAll() {
        return companyDao.findAll();
    }

    @Transactional(readOnly = false)
    public void removeById(String id) {
        companyDao.delete(id);
    }//  setter and getter

    public CompanyDao getCompanyDao() {
        return companyDao;
    }

    @Autowired
    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }
}