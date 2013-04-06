package org.minispm.security.service;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.minispm.security.dao.RoleDao;
import org.minispm.security.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 13-1-19
 * Time: 下午6:55
 */
@Service
@Transactional(readOnly = true)
public class RoleService {
    private RoleDao roleDao;

    @RequiresRoles("administrator")
    public List<Role> getAll(){
        return roleDao.findAll();
    }

    @RequiresRoles("administrator")
    public Role getById(String id){
        return roleDao.findOne(id);
    }

    @RequiresRoles("administrator")
    @Transactional(readOnly = false)
    public Role save(Role role){
        return  roleDao.save(role);
    }

    @Autowired
    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }
}
