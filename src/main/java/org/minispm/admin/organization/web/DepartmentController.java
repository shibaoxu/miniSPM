package org.minispm.admin.organization.web;

import org.minispm.admin.organization.service.DepartmentService;
import org.minispm.admin.organization.entity.Department;
import org.minispm.core.web.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * User: shibaoxu
 * Date: 12-12-15
 * Time: 下午7:38
 */
@Controller
@RequestMapping("/admin/departments")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;


    @RequestMapping()
    public String getAll(@RequestParam(value = "search_condition", defaultValue = "") String condition,
                         @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        model.addAttribute("searchParams", WebUtils.transParamsWithPrefix(request, "search_"));
        model.addAttribute("departments", departmentService.findAll(pageNumber, condition));
        return "admin/departmentList";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String initCreateForm(Model model){
        model.addAttribute("department", new Department());
        return "/admin/department";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String create(Department department){
        departmentService.save(department);
        return "redirect:..";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String initUpdateForm(@PathVariable String id, Model model) {
        model.addAttribute(departmentService.findById(id));
        return "/admin/department";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.PUT)
    public String update(Department department){
        departmentService.save(department);
        return "redirect:../index";
    }

    @RequestMapping(value = "/{id}/delete")
    public String delete(@PathVariable String id){
        departmentService.removeById(id);
        return "redirect:../index";
    }

    @RequestMapping(value = "/unassigned/{orgTypeId}", produces = "application/json")
    @ResponseBody
    public List<Department> getUnassignedDepartments(@PathVariable("orgTypeId") String orgTypeId){
        return departmentService.getUnassignedDepartments(orgTypeId);
    }
    @ExceptionHandler
    public ModelAndView exceptionHandler(Exception ex) {
        ModelAndView mv = new ModelAndView();
        mv.getModel().put("message", ex.getMessage());
        mv.setViewName("exception");
        return mv;
    }

}
