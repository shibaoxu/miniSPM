package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.DepartmentDao;
import org.minispm.admin.organization.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.lang.Exception;
import java.util.List;

@Service
public class DepartmentService {
    private DepartmentDao departmentDao;

    public DepartmentService() {
    }

    @Transactional(readOnly = false)
    public Department save(Department department) {
        return departmentDao.save(department);
    }

    public Department findById(String id) {
        return departmentDao.findOne(id);
    }

    public List<Department> findAll() {
        return departmentDao.findAll();
    }

    @Transactional(readOnly = false)
    public void removeById(String id) {
        try {
            departmentDao.delete(id);
        }finally {
            throw new RuntimeException("组织已经被使用，不能删除。");
        }
    }
    public List<Department> getUnassignedDepartments(String org_type){
        return departmentDao.getUnassignedDepartments(org_type);
    }

    public DepartmentDao getDepartmentDao() {
        return departmentDao;
    }

    @Autowired
    public void setDepartmentDao(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }
}