package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.CompanyDao;
import org.minispm.admin.organization.entity.Company;
import org.minispm.core.persistence.BaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class CompanyService {
    @Autowired
    public CompanyDao companyDao;
//    private BaseDao<Company> companyDao;

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

//    public BaseDao<Company> getCompanyDao() {
//        return companyDao;
//    }

//    @Autowired
//    public void setCompanyDao(BaseDao<Company> companyDao) {
//        this.companyDao = companyDao;
//    }
}