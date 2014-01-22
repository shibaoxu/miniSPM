package org.minispm.security.web;

import org.minispm.security.entity.Role;
import org.minispm.security.service.DomainService;
import org.minispm.security.service.PermissionService;
import org.minispm.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-2-9
 * Time: 下午5:32
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "security/role")
public class RoleController {

    private RoleService roleService;
    private PermissionService permissionService;
    private DomainService domainService;

    @RequestMapping(value = "index")
    public String index(Model model) {
        model.addAttribute("roles", roleService.getAll());
        return "security/roleList";
    }

    @RequestMapping(value = "{roleId}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable String roleId, Model model) {
        model.addAttribute("role", roleService.getById(roleId));
        return "security/role";
    }

    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String add(Model model) {
        Role role = new Role();
        model.addAttribute("role", role);
        return "security/role";
    }

    @RequestMapping(value = {"new", "{roleId}/edit"}, method = RequestMethod.POST)
    public String save(@ModelAttribute Role role) {
        roleService.save(role);
        return "redirect:/security/role/index";
    }

    @RequestMapping(value = "{roleId}/remove", method = RequestMethod.GET)
    public String remove(@PathVariable("roleId") String roleId){
        roleService.remove(roleId);
        return "redirect:/security/role/index";
    }

    @RequestMapping(value = "{roleId}/addPermission", method = RequestMethod.POST)
    @ResponseBody
    public String addPermissionToRole(@PathVariable("roleId") String roleId,
                                      @RequestParam(value = "operationId") String operationId,
                                      @RequestParam(value = "scope") String scope) {
        permissionService.addPermissionToRole(roleId, operationId, scope);
        return "success";
    }

    @RequestMapping(value = "{roleId}/permissions", method = RequestMethod.GET)
    public String getRolePermission(@PathVariable("roleId") String roleId, Model model) {
        model.addAttribute("role", roleService.getById(roleId));
        model.addAttribute("domains", domainService.getAll());
        return "security/role-permissions";
    }

    @RequestMapping(value = "{roleId}/users", method = RequestMethod.GET)
    public String getRoleUsers(@PathVariable String roleId, Model model) {
        Role role = roleService.getById(roleId);
        model.addAttribute("role", role);
        return "security/role-users";
    }

    @RequestMapping(value = "{roleId}/addUsers", method = RequestMethod.POST)
    @ResponseBody
    public String addUsers(@PathVariable("roleId") String roleId, @RequestParam("userIds[]") String[] userIds) {
        roleService.addUser(roleId, userIds);
        return "success";
    }

    @RequestMapping(value = "{roleId}/removeUser/{userId}", method = RequestMethod.POST)
    @ResponseBody
    public String removeUser(@PathVariable("roleId") String roleId, @PathVariable("userId") String userId) {
        roleService.removeUser(roleId, userId);
        return "success";
    }

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @Autowired
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }

    @Autowired
    public void setDomainService(DomainService domainService) {
        this.domainService = domainService;
    }
}
