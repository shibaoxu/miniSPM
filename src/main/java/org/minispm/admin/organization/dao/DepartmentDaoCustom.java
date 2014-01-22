package org.minispm.admin.organization.dao;

import org.minispm.admin.organization.entity.Department;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-12-20
 * Time: 下午2:31
 * To change this template use File | Settings | File Templates.
 */
public interface DepartmentDaoCustom {
    List<Department> getUnassignedDeparmtts(String orgType);
}
