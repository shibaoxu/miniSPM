package org.minispm.admin.organization.web;

import org.minispm.admin.organization.entity.Department;
import org.minispm.admin.organization.entity.Staff;
import org.minispm.admin.organization.service.StaffService;
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
 * Date: 13-12-18
 * Time: 下午3:40
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("admin/org/staff")
public class StaffController {
    private StaffService staffService;

    @RequestMapping("index")
    public String index(Model model){
        List<Staff> staffs = staffService.findAllStaff();
        model.addAttribute("staffs", staffs);
        return "admin/org/staffList";
    }

    @RequestMapping(value = {"new","{staffId}/edit"}, method = RequestMethod.POST)
    public String add(Staff staff){
        staffService.saveStaff(staff);
        return "redirect:/admin/org/staff/index";
    }

    @RequestMapping(value = {"new"}, method = RequestMethod.GET)
    public String add(Model model){
        Staff staff = new Staff();
        model.addAttribute("staff", staff);
        model.addAttribute("updatable", true);
        return "admin/org/staff";
    }

    @RequestMapping(value = {"{staffId}/edit"}, method = RequestMethod.GET)
    public String edit(@PathVariable("staffId") String staffId, Model model){
        Staff staff = staffService.findStaffById(staffId);
        model.addAttribute("staff", staff);
        model.addAttribute("updatable",true);
        return "admin/org/staff";
    }

    @RequestMapping(value = {"{staffId}/view"}, method = RequestMethod.GET)
    public String view(@PathVariable("staffId") String staffId, Model model){
        Staff staff = staffService.findStaffById(staffId);
        model.addAttribute("staff", staff);
        model.addAttribute("updatable",false);
        return "admin/org/staff";
    }
    @RequestMapping(value = "{staffId}/remove")
    public String remove(@PathVariable("staffId") String staffId){
        staffService.removeStaffById(staffId);
        return "redirect:../index";
    }
    @RequestMapping(value = "/unassigned/{orgTypeId}", produces = "application/json")
    @ResponseBody
    public List<Staff> getUnassigned(@PathVariable("orgTypeId") String orgTypeId){
        return staffService.getUnassigned(orgTypeId);
    }
    @Autowired
    public void setStaffService(StaffService staffService) {
        this.staffService = staffService;
    }
}
