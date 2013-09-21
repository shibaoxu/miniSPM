package org.minispm.security.web;

import org.minispm.security.entity.Permission;
import org.minispm.security.service.DomainService;
import org.minispm.security.service.PermissionService;
import org.minispm.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/security/domain/{DomainId}/permission/index", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Permission> getByDomain(@PathVariable("DomainId") String id){
       return permissionService.getByDomain(id);
    }

    @RequestMapping(value = "/security/role/permissions/{roleId}")
    public String getRolePermission(@PathVariable("roleId") String roleId, Model model){
        model.addAttribute("role", roleService.getById(roleId));
        model.addAttribute("domains", domainService.getAll());
        return "security/role-permissions";
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
