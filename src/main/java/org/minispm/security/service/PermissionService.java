package org.minispm.security.service;

import org.minispm.security.dao.PermissionDao;
import org.minispm.security.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-10
 * Time: 下午3:23
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional(readOnly = true)
public class PermissionService {
    private PermissionDao permissionDao;
    public List<Permission> getAll(){
        List<String> sorts = new ArrayList<String>();
        sorts.add("operation.domain.name");
        sorts.add("operation.name");
        sorts.add("scope");
        return permissionDao.findAll(new Sort(Sort.Direction.ASC, sorts)) ;
    }

    @Autowired
    public void setPermissionDao(PermissionDao permissionDao) {
        this.permissionDao = permissionDao;
    }
}
