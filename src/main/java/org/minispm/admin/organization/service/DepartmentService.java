package org.minispm.admin.organization.service;

import org.minispm.admin.organization.dao.DepartmentDao;
import org.minispm.admin.organization.entity.Department;
import org.minispm.core.web.DisplayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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

    public Page<Department> findAll(int pageNumber, final String condition){
        Specification<Department> specification = new Specification<Department>() {
            @Override
            public Predicate toPredicate(Root<Department> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                return  cb.like(root.get("name"), "%"+ condition + "%");
            }
        };
        Pageable pageable = new PageRequest(pageNumber - 1, DisplayUtils.ROW_NUMBER_OF_PAGE, new Sort(Sort.Direction.ASC, "name" ));
        return departmentDao.findAll(specification, pageable);
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