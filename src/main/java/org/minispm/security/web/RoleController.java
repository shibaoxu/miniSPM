package org.minispm.security.web;

import org.minispm.security.entity.Role;
import org.minispm.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value = "index")
    public String index(Model model){
        model.addAttribute("roles", roleService.getAll());
        return "security/roleList";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model){
        model.addAttribute("role", roleService.getById(id));
        return "security/role";
    }

    @RequestMapping(value = {"new", "edit/{id}"}, method = RequestMethod.POST)
//    public String save(@ModelAttribute Role role){
    public String save(@RequestBody Role role){

        roleService.save(role);
        return "redirect:/security/role/index";
    }

    @RequestMapping(value = {"test"}, method = RequestMethod.POST)
    public String Test(@RequestBody Role role){
        System.out.println("");
        return "redirect:/security/role/index";
    }
    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }
}
