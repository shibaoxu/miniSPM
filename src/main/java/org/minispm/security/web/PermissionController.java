package org.minispm.security.web;

import org.minispm.security.entity.Permission;
import org.minispm.security.service.DomainService;
import org.minispm.security.service.PermissionService;
import org.minispm.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-10
 * Time: 下午3:27
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class PermissionController {

    private PermissionService permissionService;
    private RoleService roleService;
    private DomainService domainService;

    @RequestMapping(value = "/security/permission/index", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Permission> getAll(){
        return permissionService.getAll();
    }

    @RequestMapping(value = "/security/role/{roleId}/domain/{domainId}/permission/index", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Permission> getPermissionsByRoleIdAndDomainId(@PathVariable("roleId") String roleId, @PathVariable("domainId") String domainId){
        return permissionService.getPermissionsByRoleIdAndDomainId(roleId, domainId);
    }

    @RequestMapping(value = "/security/role/{roleId}/removePermission/{permissionId}", method = RequestMethod.POST)
    @ResponseBody
    public String removePermissionFromRole(@PathVariable("roleId") String roleId, @PathVariable("permissionId") String permissionId){
        permissionService.removePermissionFromRole(roleId, permissionId);
        return "success";
    }




    @Autowired
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }
    @Autowired
    public void setDomainService(DomainService domainService) {
        this.domainService = domainService;
    }
}
