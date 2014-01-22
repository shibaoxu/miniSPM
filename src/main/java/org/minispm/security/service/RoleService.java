package org.minispm.security.service;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.minispm.security.dao.RoleDao;
import org.minispm.security.entity.Role;
import org.minispm.security.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
    @RequiresRoles("administrator")
    @Transactional(readOnly = false)
    public void addUser(String roleId, String[] userIds){
        Role role = roleDao.findOne(roleId);
        List<String> usersOfRole = new ArrayList<String>();
        for(User user : role.getUsers()){
            usersOfRole.add(user.getId());
        }
        for(String id : userIds){
            if(usersOfRole.contains(id)){
                continue;
            }else{
                User user = new User();
                user.setId(id);
                role.getUsers().add(user);
            }
        }
        roleDao.save(role);
    }

    @RequiresRoles("administrator")
    @Transactional(readOnly = false)
    public void remove(String roleId){
        roleDao.delete(roleId);
    }
    @RequiresRoles("administrator")
    @Transactional(readOnly = false)
    public void removeUser(String roleId, String userId){
        roleDao.removeUser(roleId, userId);
    }

    @Autowired
    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }
}
