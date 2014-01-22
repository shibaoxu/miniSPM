package org.minispm.security.service;

import org.minispm.security.dao.OperationDao;
import org.minispm.security.dao.PermissionDao;
import org.minispm.security.dao.RoleDao;
import org.minispm.security.entity.Domain;
import org.minispm.security.entity.Permission;
import org.minispm.security.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.lang3.StringUtils;
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
    private RoleService roleService;
    private OperationDao operationDao;
    public List<Permission> getAll(){
        List<String> sorts = new ArrayList<String>();
        sorts.add("operation.domain.name");
        sorts.add("operation.name");
        sorts.add("scope");
        return permissionDao.findAll(new Sort(Sort.Direction.ASC, sorts)) ;
    }

    public List<Permission> getByDomain(String id){
        return permissionDao.findByOperationDomainId(id);
    }

    public List<Permission> getPermissionsByRoleIdAndDomainId(String roleId, String domainId){
        List<Permission> permissions = new ArrayList<Permission>();
        Role role = roleService.getById(roleId);
        for(Permission p : role.getPermissions()){
            if(StringUtils.equals(p.getOperation().getDomain().getId(), domainId)){
                permissions.add(p);
            }
        }
        return permissions;
    }

    @Transactional(readOnly = false)
    public void removePermissionFromRole(String roleId, String permissionId){
        Role role = roleService.getById(roleId);
        for(Permission p : role.getPermissions()){
            if(StringUtils.equals(permissionId, p.getId())){
                role.getPermissions().remove(p);
                break;
            }
        }
        permissionDao.delete(permissionId);
    }

    @Transactional(readOnly = false)
    public void addPermissionToRole(String roleId, String operationId, String scope){
        Permission permission = null;
        //如果权限组合已经存在则获取该权限，如果次权限组合不存在则生成新的权限
        List<Permission> permissions = permissionDao.findByOperationIdAndScope(operationId, scope);
        if(permissions.size() > 0){
            permission = permissions.get(0);
        }else{
            permission = new Permission();
            permission.setOperation(operationDao.findOne(operationId));
            permission.setScope(scope);
            permissionDao.save(permission);
        }

        Role role = roleService.getById(roleId);
        for(Permission p : role.getPermissions()){
            if(StringUtils.equals(p.getOperation().getId(), operationId)){
                //如果该权限已经存在则do nothing
                if(StringUtils.equals(p.getScope(), scope)){
                    return;
                }
                //如果该operation已经有权限存在则删除已存在权限，增加新的权限
                else{
                    role.getPermissions().remove(p);
                    break;
                }
            }
        }

        role.getPermissions().add(permission);
        roleService.save(role);
    }


    @Autowired
    public void setPermissionDao(PermissionDao permissionDao) {
        this.permissionDao = permissionDao;
    }

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @Autowired
    public void setOperationDao(OperationDao operationDao) {
        this.operationDao = operationDao;
    }
}
