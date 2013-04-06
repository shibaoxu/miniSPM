package org.minispm.admin.organization.web;

import org.minispm.admin.organization.service.DepartmentService;
import org.minispm.admin.organization.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午7:38
 */
@Controller
@RequestMapping("/admin/org/department/")
public class DepartmentController {
    private DepartmentService departmentService;

    @RequestMapping("/index")
    public String index(Model model){
        List<Department> departments = departmentService.findAll();
        model.addAttribute("departments", departments);
        return "admin/org/departmentList";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String add(Model model){
        model.addAttribute("department", new Department());
        model.addAttribute("updatable", true);
        return "/admin/org/department";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String add(Department department){
        departmentService.save(department);
        return "redirect:index";
    }

    @RequestMapping("/view/{id}")
    public String view(@PathVariable String id, Model model) {
        return showDepartment(id, model, false);
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model) {
        return showDepartment(id, model, true);
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
    public String update(Department department){
        departmentService.save(department);
        return "redirect:../index";
    }

    @RequestMapping(value = "del/{id}")
    public String delete(@PathVariable String id){
        departmentService.removeById(id);
        return "redirect:../index";
    }

    private String showDepartment(String id, Model model, boolean updatable){
        Department department = departmentService.findById(id);
        model.addAttribute("department", department);
        model.addAttribute("updatable", updatable);
        return "admin/org/department";
    }

    public DepartmentService getDepartmentService() {
        return departmentService;
    }
    @Autowired
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
}
